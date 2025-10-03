import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../core/widgets/loading_indicator.dart';
import '../../bloc/home/home_bloc.dart';
import 'widgets/hero_section.dart';
import 'widgets/contract_info_card.dart';
import 'widgets/utility_prices_card.dart';

/// Home screen displaying a summary of the user's dormitory status.
///
/// It shows a hero section with greeting and quick actions followed by
/// cards containing contract information and utility pricing. When
/// loading data it displays a [LoadingIndicator].
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading || state is HomeInitial) {
              return const LoadingIndicator();
            } else if (state is HomeLoaded) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(AppSizes.m),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    HeroSection(
                      user: state.user,
                      roomName: state.room.name,
                    ),
                    const SizedBox(height: AppSizes.l),
                    ContractInfoCard(contract: state.contract),
                    const SizedBox(height: AppSizes.l),
                    UtilityPricesCard(prices: state.utilityPrices),
                  ],
                ),
              );
            } else if (state is HomeError) {
              return Center(child: Text('Lỗi: ${state.message}'));
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}