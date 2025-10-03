import '../models/notification_model.dart';
import '../../services/mock_data_service.dart';

/// Repository for retrieving notifications.
class NotificationRepository {
  final MockDataService _service;
  NotificationRepository(this._service);

  /// Retrieve all notifications, optionally filtering by type.
  Future<List<NotificationModel>> getNotifications({NotificationType? type}) {
    return _service.getNotifications(type: type);
  }
}