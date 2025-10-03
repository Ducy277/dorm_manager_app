import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/contract_model.dart';
import '../../../data/repositories/contract_repository.dart';

part 'contract_event.dart';
part 'contract_state.dart';

/// Bloc managing contract related actions and state.
class ContractBloc extends Bloc<ContractEvent, ContractState> {
  final ContractRepository contractRepository;

  ContractBloc({required this.contractRepository}) : super(ContractInitial()) {
    on<LoadContracts>(_onLoadContracts);
    on<LoadContractDetail>(_onLoadContractDetail);
    on<RenewContract>(_onRenewContract);
    on<CancelContract>(_onCancelContract);
  }

  Future<void> _onLoadContracts(
      LoadContracts event, Emitter<ContractState> emit) async {
    emit(ContractLoading());
    try {
      final contracts = await contractRepository.getContracts();
      emit(ContractsLoaded(contracts: contracts));
    } catch (e) {
      emit(ContractError(message: e.toString()));
    }
  }

  Future<void> _onLoadContractDetail(
      LoadContractDetail event, Emitter<ContractState> emit) async {
    emit(ContractLoading());
    try {
      final contract = await contractRepository.getContractById(event.id);
      emit(ContractDetailLoaded(contract: contract));
    } catch (e) {
      emit(ContractError(message: e.toString()));
    }
  }

  Future<void> _onRenewContract(
      RenewContract event, Emitter<ContractState> emit) async {
    emit(ContractLoading());
    try {
      final contract = await contractRepository.renewContract(event.id);
      emit(ContractDetailLoaded(contract: contract));
    } catch (e) {
      emit(ContractError(message: e.toString()));
    }
  }

  Future<void> _onCancelContract(
      CancelContract event, Emitter<ContractState> emit) async {
    emit(ContractLoading());
    try {
      final contract = await contractRepository.cancelContract(event.id);
      emit(ContractDetailLoaded(contract: contract));
    } catch (e) {
      emit(ContractError(message: e.toString()));
    }
  }
}