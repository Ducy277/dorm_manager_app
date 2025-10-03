part of 'request_bloc.dart';

/// Base class for all request events.
abstract class RequestEvent extends Equatable {
  const RequestEvent();

  @override
  List<Object?> get props => [];
}

/// Event to load all requests for the user.
class LoadRequests extends RequestEvent {
  final RequestType? type;
  const LoadRequests({this.type});

  @override
  List<Object?> get props => [type];
}

/// Event to create a new request.
class CreateRequest extends RequestEvent {
  final RequestModel request;
  const CreateRequest(this.request);

  @override
  List<Object?> get props => [request];
}