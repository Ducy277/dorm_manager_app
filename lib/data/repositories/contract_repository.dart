import '../models/contract_model.dart';
import '../models/utility_price_model.dart';
import '../../services/mock_data_service.dart';

/// Repository encapsulating contract related operations.
class ContractRepository {
  final MockDataService _service;
  ContractRepository(this._service);

  /// Retrieve the contract currently in effect for the user.
  Future<ContractModel> getCurrentContract() {
    return _service.getCurrentContract();
  }

  /// Retrieve all contracts associated with the user.
  Future<List<ContractModel>> getContracts() {
    return _service.getContracts();
  }

  /// Retrieve a single contract by its identifier.
  Future<ContractModel> getContractById(String id) {
    return _service.getContractById(id);
  }

  /// Retrieve the current utility prices. These may be associated with
  /// the contract or could be general to the dormitory.
  Future<List<UtilityPriceModel>> getUtilityPrices() {
    return _service.getUtilityPrices();
  }

  /// Placeholder for renewing a contract. Returns the updated contract.
  Future<ContractModel> renewContract(String id) {
    return _service.renewContract(id);
  }

  /// Placeholder for canceling a contract. Returns the canceled contract.
  Future<ContractModel> cancelContract(String id) {
    return _service.cancelContract(id);
  }
}