import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/notification_model.dart';
import '../../../data/repositories/notification_repository.dart';

part 'notification_event.dart';
part 'notification_state.dart';

/// Bloc responsible for loading notifications and filtering them by type.
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRepository notificationRepository;

  NotificationBloc({required this.notificationRepository})
      : super(const NotificationInitial()) {
    on<LoadNotifications>(_onLoadNotifications);
  }

  Future<void> _onLoadNotifications(
      LoadNotifications event, Emitter<NotificationState> emit) async {
    emit(const NotificationLoading());
    try {
      final notifications = await notificationRepository.getNotifications(
        type: event.type,
      );
      emit(NotificationsLoaded(notifications: notifications));
    } catch (e) {
      emit(NotificationError(message: e.toString()));
    }
  }
}