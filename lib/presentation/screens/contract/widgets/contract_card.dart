import 'package:flutter/material.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/widgets/custom_card.dart';
import '../../../../data/models/contract_model.dart';

/// A simple card that displays basic information about a contract.
class ContractCard extends StatelessWidget {
  final ContractModel contract;
  final VoidCallback? onTap;

  const ContractCard({Key? key, required this.contract, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: onTap,
      child: Row(
        children: [
          const Icon(Icons.description_outlined, size: 32.0),
          const SizedBox(width: AppSizes.m),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(contract.name,
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: AppSizes.xs),
                Text('Trạng thái: ${contract.status}'),
                Text(
                  'Hiệu lực: ${DateFormatter.formatDate(contract.startDate)} - ${DateFormatter.formatDate(contract.endDate)}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}