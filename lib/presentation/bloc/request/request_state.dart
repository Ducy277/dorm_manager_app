part of 'request_bloc.dart';

/// Base state class for the request feature.
abstract class RequestState extends Equatable {
  const RequestState();

  @override
  List<Object?> get props => [];
}

/// Initial state before any data is loaded.
class RequestInitial extends RequestState {
  const RequestInitial();
}

/// Loading state for requests.
class RequestLoading extends RequestState {
  const RequestLoading();
}

/// State containing a list of loaded requests.
class RequestsLoaded extends RequestState {
  final List<RequestModel> requests;
  const RequestsLoaded({required this.requests});

  @override
  List<Object?> get props => [requests];
}

/// State representing an error during request processing.
class RequestError extends RequestState {
  final String message;
  const RequestError({required this.message});

  @override
  List<Object?> get props => [message];
}