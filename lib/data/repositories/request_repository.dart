import '../models/request_model.dart';
import '../../services/mock_data_service.dart';

/// Repository for managing requests.
class RequestRepository {
  final MockDataService _service;
  RequestRepository(this._service);

  /// Retrieve all requests submitted by the user.
  Future<List<RequestModel>> getRequests() {
    return _service.getRequests();
  }

  /// Create a new request.
  Future<void> createRequest(RequestModel request) {
    return _service.addRequest(request);
  }
}