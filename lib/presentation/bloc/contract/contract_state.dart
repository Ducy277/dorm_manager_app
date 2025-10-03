part of 'contract_bloc.dart';

/// Base class for states emitted by [ContractBloc].
abstract class ContractState extends Equatable {
  const ContractState();

  @override
  List<Object?> get props => [];
}

/// Initial state before any contracts are loaded.
class ContractInitial extends ContractState {
  const ContractInitial();
}

/// State while contract data is loading or an action is processing.
class ContractLoading extends ContractState {
  const ContractLoading();
}

/// State with a list of contracts.
class ContractsLoaded extends ContractState {
  final List<ContractModel> contracts;
  const ContractsLoaded({required this.contracts});

  @override
  List<Object?> get props => [contracts];
}

/// State with a single contract detail.
class ContractDetailLoaded extends ContractState {
  final ContractModel contract;
  const ContractDetailLoaded({required this.contract});

  @override
  List<Object?> get props => [contract];
}

/// State representing an error during a contract operation.
class ContractError extends ContractState {
  final String message;
  const ContractError({required this.message});

  @override
  List<Object?> get props => [message];
}