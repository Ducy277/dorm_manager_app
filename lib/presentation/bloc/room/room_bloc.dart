import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/room_model.dart';
import '../../../data/repositories/room_repository.dart';

part 'room_event.dart';
part 'room_state.dart';

/// Bloc responsible for loading the user's room details.
class RoomBloc extends Bloc<RoomEvent, RoomState> {
  final RoomRepository roomRepository;

  RoomBloc({required this.roomRepository}) : super(const RoomInitial()) {
    on<LoadRoom>(_onLoadRoom);
  }

  Future<void> _onLoadRoom(
      LoadRoom event, Emitter<RoomState> emit) async {
    emit(const RoomLoading());
    try {
      final room = await roomRepository.getCurrentRoom();
      emit(RoomLoaded(room: room));
    } catch (e) {
      emit(RoomError(message: e.toString()));
    }
  }
}