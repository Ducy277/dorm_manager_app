part of 'room_bloc.dart';

/// Base state for the room bloc.
abstract class RoomState extends Equatable {
  const RoomState();

  @override
  List<Object?> get props => [];
}

/// Initial state before the room data is fetched.
class RoomInitial extends RoomState {
  const RoomInitial();
}

/// Loading state when the room details are being retrieved.
class RoomLoading extends RoomState {
  const RoomLoading();
}

/// State containing the loaded [RoomModel].
class RoomLoaded extends RoomState {
  final RoomModel room;
  const RoomLoaded({required this.room});

  @override
  List<Object?> get props => [room];
}

/// Error state when something goes wrong retrieving the room.
class RoomError extends RoomState {
  final String message;
  const RoomError({required this.message});

  @override
  List<Object?> get props => [message];
}