import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/custom_button.dart';
// Adjust relative import to reach the bloc directory from within the nested widgets folder.
// We navigate up three levels: widgets → contract → screens → presentation,
// then down to bloc/contract/contract_bloc.dart
import '../../../bloc/contract/contract_bloc.dart';

/// A row of action buttons for a contract detail view.
///
/// Dispatches events to the provided [ContractBloc] to renew or cancel
/// the contract. The contract identifier is passed in so that the
/// corresponding event can reference it.
class ContractActions extends StatelessWidget {
  final String contractId;
  const ContractActions({Key? key, required this.contractId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            label: AppStrings.renew,
            icon: Icons.autorenew,
            onPressed: () {
              context.read<ContractBloc>().add(RenewContract(contractId));
            },
          ),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: CustomButton(
            label: AppStrings.cancel,
            icon: Icons.cancel_outlined,
            color: Theme.of(context).colorScheme.error,
            onPressed: () {
              context.read<ContractBloc>().add(CancelContract(contractId));
            },
          ),
        ),
      ],
    );
  }
}