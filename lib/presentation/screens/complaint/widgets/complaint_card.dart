import 'package:flutter/material.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/widgets/custom_card.dart';
import '../../../../data/models/complaint_model.dart';

/// Card displaying a complaint's details.
class ComplaintCard extends StatelessWidget {
  final ComplaintModel complaint;
  const ComplaintCard({Key? key, required this.complaint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            complaint.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: AppSizes.xs),
          Text(
            complaint.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: AppSizes.xs),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Trạng thái: ${complaint.status}'),
              Text(DateFormatter.formatDate(complaint.createdAt)),
            ],
          ),
        ],
      ),
    );
  }
}