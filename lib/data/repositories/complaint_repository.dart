import '../models/complaint_model.dart';
import '../../services/mock_data_service.dart';

/// Repository for managing complaints.
class ComplaintRepository {
  final MockDataService _service;
  ComplaintRepository(this._service);

  /// Retrieve all complaints submitted by the user.
  Future<List<ComplaintModel>> getComplaints() {
    return _service.getComplaints();
  }

  /// Create a new complaint.
  Future<void> createComplaint(ComplaintModel complaint) {
    return _service.addComplaint(complaint);
  }
}