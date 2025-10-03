import '../models/user_model.dart';
import '../../services/mock_data_service.dart';

/// Repository responsible for retrieving user information.
///
/// In a real application this repository would abstract away the
/// underlying data source (e.g. Supabase) and provide caching or
/// transformation logic. For now it simply proxies to the
/// [MockDataService].
class UserRepository {
  final MockDataService _service;
  UserRepository(this._service);

  /// Fetch the currently logged in user.
  Future<UserModel> getCurrentUser() {
    return _service.getUser();
  }
}