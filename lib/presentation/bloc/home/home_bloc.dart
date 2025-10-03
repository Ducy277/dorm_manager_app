import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/user_model.dart';
import '../../../data/models/contract_model.dart';
import '../../../data/models/room_model.dart';
import '../../../data/models/utility_price_model.dart';
import '../../../data/repositories/user_repository.dart';
import '../../../data/repositories/contract_repository.dart';
import '../../../data/repositories/room_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

/// Bloc responsible for gathering data for the home screen.
///
/// It fetches the current user, active contract, current room and
/// utility prices. If any of these fail the state will become
/// [HomeError].
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserRepository userRepository;
  final ContractRepository contractRepository;
  final RoomRepository roomRepository;

  HomeBloc({
    required this.userRepository,
    required this.contractRepository,
    required this.roomRepository,
  }) : super(HomeInitial()) {
    on<LoadHomeData>(_onLoadHome);
  }

  Future<void> _onLoadHome(
      LoadHomeData event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final user = await userRepository.getCurrentUser();
      final contract = await contractRepository.getCurrentContract();
      final room = await roomRepository.getCurrentRoom();
      final utilityPrices = await contractRepository.getUtilityPrices();
      emit(HomeLoaded(
        user: user,
        contract: contract,
        room: room,
        utilityPrices: utilityPrices,
      ));
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }
}