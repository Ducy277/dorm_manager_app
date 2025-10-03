part of 'home_bloc.dart';

/// Base class for all events that can be dispatched to [HomeBloc].
abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

/// Event to trigger loading of home screen data.
class LoadHomeData extends HomeEvent {
  const LoadHomeData();
}