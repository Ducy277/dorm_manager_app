import '../models/room_model.dart';
import '../../services/mock_data_service.dart';

/// Repository for accessing room information.
class RoomRepository {
  final MockDataService _service;
  RoomRepository(this._service);

  /// Fetch the current room of the user.
  Future<RoomModel> getCurrentRoom() {
    return _service.getRoom();
  }
}