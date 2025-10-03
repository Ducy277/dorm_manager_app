import 'package:flutter/material.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../../../core/widgets/custom_card.dart';
import '../../../../data/models/utility_price_model.dart';

/// A card that displays the prices of utilities such as electricity and water.
class UtilityPricesCard extends StatelessWidget {
  final List<UtilityPriceModel> prices;
  const UtilityPricesCard({Key? key, required this.prices}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Đơn giá',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: AppSizes.s),
          ...prices.map((p) => Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSizes.xs),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(p.name),
                    Text('${p.price.toStringAsFixed(0)} VND'),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}