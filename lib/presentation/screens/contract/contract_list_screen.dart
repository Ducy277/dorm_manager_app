import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/loading_indicator.dart';
import '../../bloc/contract/contract_bloc.dart';
import '../../../data/repositories/contract_repository.dart';
import 'widgets/contract_card.dart';

/// Screen displaying all contracts associated with the user.
class ContractListScreen extends StatelessWidget {
  const ContractListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách hợp đồng'),
      ),
      body: BlocProvider(
        create: (context) => ContractBloc(
          contractRepository: context.read<ContractRepository>(),
        )..add(const LoadContracts()),
        child: BlocBuilder<ContractBloc, ContractState>(
          builder: (context, state) {
            if (state is ContractLoading || state is ContractInitial) {
              return const LoadingIndicator();
            } else if (state is ContractsLoaded) {
              final contracts = state.contracts;
              return ListView.separated(
                padding: const EdgeInsets.all(16.0),
                itemBuilder: (context, index) {
                  final contract = contracts[index];
                  return ContractCard(
                    contract: contract,
                    onTap: () {
                      context.push('/contracts/${contract.id}');
                    },
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(height: 12.0),
                itemCount: contracts.length,
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