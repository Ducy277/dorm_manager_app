part of 'home_bloc.dart';

/// Base class for states emitted by [HomeBloc].
abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

/// Initial state before any data is loaded.
class HomeInitial extends HomeState {
  const HomeInitial();
}

/// Loading state while data is being fetched.
class HomeLoading extends HomeState {
  const HomeLoading();
}

/// Loaded state containing user, contract, room and utility information.
class HomeLoaded extends HomeState {
  final UserModel user;
  final ContractModel contract;
  final RoomModel room;
  final List<UtilityPriceModel> utilityPrices;

  const HomeLoaded({
    required this.user,
    required this.contract,
    required this.room,
    required this.utilityPrices,
  });

  @override
  List<Object?> get props => [user, contract, room, utilityPrices];
}

/// Error state containing a message describing what went wrong.
class HomeError extends HomeState {
  final String message;
  const HomeError({required this.message});

  @override
  List<Object?> get props => [message];
}