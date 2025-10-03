import 'package:flutter/material.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/widgets/custom_card.dart';
import '../../../../data/models/request_model.dart';

/// Displays a summary of a request.
class RequestCard extends StatelessWidget {
  final RequestModel request;
  const RequestCard({Key? key, required this.request}) : super(key: key);

  String _typeLabel(RequestType type) {
    switch (type) {
      case RequestType.changeRoom:
        return 'Đổi phòng';
      case RequestType.repair:
        return 'Sửa chữa';
      case RequestType.checkout:
        return 'Trả phòng';
      case RequestType.other:
      default:
        return 'Khác';
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _typeLabel(request.type),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: AppSizes.xs),
          Text(request.description,
              maxLines: 2, overflow: TextOverflow.ellipsis),
          const SizedBox(height: AppSizes.xs),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Trạng thái: ${request.status}'),
              Text(DateFormatter.formatDate(request.createdAt)),
            ],
          ),
        ],
      ),
    );
  }
}