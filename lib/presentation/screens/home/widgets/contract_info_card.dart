import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_card.dart';
import '../../../../data/models/contract_model.dart';

/// A card displaying summary information about the current contract.
///
/// Shows the contract name, status, price and validity period along with
/// action buttons to view details, renew or cancel. The actions
/// navigate to the contract detail page using the router.
class ContractInfoCard extends StatelessWidget {
  final ContractModel contract;

  const ContractInfoCard({Key? key, required this.contract}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            contract.name,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: AppSizes.s),
          Text('Trạng thái: ${contract.status}'),
          Text('Giá: ${contract.price.toStringAsFixed(0)} VND'),
          Text(
            'Hiệu lực: ${DateFormatter.formatDate(contract.startDate)} - ${DateFormatter.formatDate(contract.endDate)}',
          ),
          const SizedBox(height: AppSizes.s),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  label: AppStrings.renew,
                  icon: Icons.autorenew,
                  onPressed: () {
                    // Navigate to detail screen where user can renew.
                    context.push('/contracts/${contract.id}');
                  },
                ),
              ),
              const SizedBox(width: AppSizes.s),
              Expanded(
                child: CustomButton(
                  label: AppStrings.cancel,
                  icon: Icons.cancel_outlined,
                  onPressed: () {
                    context.push('/contracts/${contract.id}');
                  },
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}