import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/app_sizes.dart';
import '../../bloc/profile/profile_bloc.dart';
//import '../../bloc/profile/profile_state.dart';
import '../../../core/widgets/loading_indicator.dart';

/// Screen displaying detailed personal information of the user.
class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin cá nhân'),
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading || state is ProfileInitial) {
            return const LoadingIndicator();
          } else if (state is ProfileLoaded) {
            final user = state.user;
            return Padding(
              padding: const EdgeInsets.all(AppSizes.m),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Họ tên: ${user.name}',
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: AppSizes.s),
                  Text('Email: ${user.email}'),
                  const SizedBox(height: AppSizes.s),
                  Text('Mã người dùng: ${user.id}'),
                  const SizedBox(height: AppSizes.s),
                  Text('Ký túc xá: ${user.dormName}'),
                ],
              ),
            );
          } else if (state is ProfileError) {
            return Center(child: Text('Lỗi: ${state.message}'));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}