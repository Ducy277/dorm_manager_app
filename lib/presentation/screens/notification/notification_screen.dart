import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/loading_indicator.dart';
import '../../../core/widgets/custom_filter_chips_slider.dart';
import '../../bloc/notification/notification_bloc.dart';
/*
import '../../bloc/notification/notification_event.dart';
import '../../bloc/notification/notification_state.dart';
import '../../bloc/notification/notification_state.dart' as notif_state;
*/
import '../../../data/models/notification_model.dart';
import 'widgets/notification_card.dart';

/// Screen displaying notifications with filtering by type.
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  NotificationType? _selectedType;

  void _onFilterSelected(NotificationType? type) {
    setState(() {
      _selectedType = type;
    });
    context.read<NotificationBloc>().add(LoadNotifications(type: type));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông báo'),
      ),
      body: BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
          if (state is NotificationLoading || state is NotificationInitial) {
            return const LoadingIndicator();
          } else if (state is NotificationsLoaded) {
            final notifications = state.notifications;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CustomFilterChipsSlider<NotificationType>(
                    selectedValue: _selectedType,
                    onSelected: _onFilterSelected,
                    items: const [
                      FilterChipItem('Tất cả', null),
                      FilterChipItem('Yêu cầu', NotificationType.request),
                      FilterChipItem('Khiếu nại', NotificationType.complaint),
                      FilterChipItem('Hệ thống', NotificationType.system),
                      FilterChipItem('Khác', NotificationType.other),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16.0),
                    itemBuilder: (context, index) {
                      final notification = notifications[index];
                      return NotificationCard(notification: notification);
                    },
                    separatorBuilder: (_, __) => const SizedBox(height: 12.0),
                    itemCount: notifications.length,
                  ),
                ),
              ],
            );
          } else if (state is NotificationError) {
            return Center(child: Text('Lỗi: ${state.message}'));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}