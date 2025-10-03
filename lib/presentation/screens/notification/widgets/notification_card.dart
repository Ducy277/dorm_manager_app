import 'package:flutter/material.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/widgets/custom_card.dart';
import '../../../../data/models/notification_model.dart';

/// A card representing a single notification.
class NotificationCard extends StatelessWidget {
  final NotificationModel notification;
  const NotificationCard({Key? key, required this.notification}) : super(key: key);

  String _typeLabel(NotificationType type) {
    switch (type) {
      case NotificationType.request:
        return 'Yêu cầu';
      case NotificationType.complaint:
        return 'Khiếu nại';
      case NotificationType.system:
        return 'Hệ thống';
      case NotificationType.other:
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  notification.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Text(
                _typeLabel(notification.type),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.xs),
          Text(
            notification.body,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: AppSizes.xs),
          Text(
            DateFormatter.formatDate(notification.date),
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}