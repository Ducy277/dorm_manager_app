part of 'room_bloc.dart';

/// Base class for room events.
abstract class RoomEvent extends Equatable {
  const RoomEvent();

  @override
  List<Object?> get props => [];
}

/// Event to trigger loading of the current room.
class LoadRoom extends RoomEvent {
  const LoadRoom();
}