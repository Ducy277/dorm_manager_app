import 'package:flutter/material.dart';

import '../../../../data/models/notification_model.dart';

/// Tabs to filter notifications by category.
class NotificationFilterTabs extends StatelessWidget {
  final NotificationType? selectedType;
  final ValueChanged<NotificationType?> onSelected;
  const NotificationFilterTabs({Key? key, required this.selectedType, required this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          ChoiceChip(
            label: const Text('Tất cả'),
            selected: selectedType == null,
            onSelected: (selected) {
              if (selected) onSelected(null);
            },
          ),
          const SizedBox(width: 8.0),
          ChoiceChip(
            label: const Text('Yêu cầu'),
            selected: selectedType == NotificationType.request,
            onSelected: (selected) {
              if (selected) onSelected(NotificationType.request);
            },
          ),
          const SizedBox(width: 8.0),
          ChoiceChip(
            label: const Text('Khiếu nại'),
            selected: selectedType == NotificationType.complaint,
            onSelected: (selected) {
              if (selected) onSelected(NotificationType.complaint);
            },
          ),
          const SizedBox(width: 8.0),
          ChoiceChip(
            label: const Text('Hệ thống'),
            selected: selectedType == NotificationType.system,
            onSelected: (selected) {
              if (selected) onSelected(NotificationType.system);
            },
          ),
          const SizedBox(width: 8.0),
          ChoiceChip(
            label: const Text('Khác'),
            selected: selectedType == NotificationType.other,
            onSelected: (selected) {
              if (selected) onSelected(NotificationType.other);
            },
          ),
        ],
      ),
    );
  }
}