part of 'notification_bloc.dart';

/// Base class for notification events.
abstract class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object?> get props => [];
}

/// Event to load notifications, optionally filtering by [type].
class LoadNotifications extends NotificationEvent {
  final NotificationType? type;
  const LoadNotifications({this.type});

  @override
  List<Object?> get props => [type];
}