part of 'notification_bloc.dart';

/// Base state for the notification bloc.
abstract class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object?> get props => [];
}

/// Initial state before notifications are loaded.
class NotificationInitial extends NotificationState {
  const NotificationInitial();
}

/// Loading state for notifications.
class NotificationLoading extends NotificationState {
  const NotificationLoading();
}

/// Loaded state containing notifications.
class NotificationsLoaded extends NotificationState {
  final List<NotificationModel> notifications;
  const NotificationsLoaded({required this.notifications});

  @override
  List<Object?> get props => [notifications];
}

/// Error state for notification operations.
class NotificationError extends NotificationState {
  final String message;
  const NotificationError({required this.message});

  @override
  List<Object?> get props => [message];
}