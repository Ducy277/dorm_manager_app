import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../core/widgets/loading_indicator.dart';
import '../../../core/utils/date_formatter.dart';
import '../../bloc/contract/contract_bloc.dart';
import '../../../data/repositories/contract_repository.dart';
import 'widgets/contract_actions.dart';

/// Screen showing detailed information about a single contract.
class ContractDetailScreen extends StatelessWidget {
  final String contractId;
  const ContractDetailScreen({Key? key, required this.contractId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết hợp đồng'),
      ),
      body: BlocProvider(
        create: (context) => ContractBloc(
          contractRepository: context.read<ContractRepository>(),
        )..add(LoadContractDetail(contractId)),
        child: BlocBuilder<ContractBloc, ContractState>(
          builder: (context, state) {
            if (state is ContractLoading || state is ContractInitial) {
              return const LoadingIndicator();
            } else if (state is ContractDetailLoaded) {
              final contract = state.contract;
              return Padding(
                padding: const EdgeInsets.all(AppSizes.m),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contract.name,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: AppSizes.s),
                    Text('Trạng thái: ${contract.status}'),
                    Text('Giá: ${contract.price.toStringAsFixed(0)} VND'),
                    Text(
                      'Thời gian: ${DateFormatter.formatDate(contract.startDate)} - ${DateFormatter.formatDate(contract.endDate)}',
                    ),
                    const SizedBox(height: AppSizes.l),
                    ContractActions(contractId: contract.id),
                  ],
                ),
              );
            } else if (state is ContractError) {
              return Center(child: Text('Lỗi: ${state.message}'));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}