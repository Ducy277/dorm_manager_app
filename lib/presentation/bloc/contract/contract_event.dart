part of 'contract_bloc.dart';

/// Base class for events consumed by [ContractBloc].
abstract class ContractEvent extends Equatable {
  const ContractEvent();

  @override
  List<Object?> get props => [];
}

/// Event to load all contracts.
class LoadContracts extends ContractEvent {
  const LoadContracts();
}

/// Event to load a specific contract by its identifier.
class LoadContractDetail extends ContractEvent {
  final String id;
  const LoadContractDetail(this.id);

  @override
  List<Object?> get props => [id];
}

/// Event to renew a contract.
class RenewContract extends ContractEvent {
  final String id;
  const RenewContract(this.id);

  @override
  List<Object?> get props => [id];
}

/// Event to cancel a contract.
class CancelContract extends ContractEvent {
  final String id;
  const CancelContract(this.id);

  @override
  List<Object?> get props => [id];
}