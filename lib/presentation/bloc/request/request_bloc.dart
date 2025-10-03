import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/request_model.dart';
import '../../../data/repositories/request_repository.dart';

part 'request_event.dart';
part 'request_state.dart';

/// Bloc responsible for handling requests.
class RequestBloc extends Bloc<RequestEvent, RequestState> {
  final RequestRepository requestRepository;

  RequestBloc({required this.requestRepository}) : super(const RequestInitial()) {
    on<LoadRequests>(_onLoadRequests);
    on<CreateRequest>(_onCreateRequest);
  }

  Future<void> _onLoadRequests(
      LoadRequests event, Emitter<RequestState> emit) async {
    emit(const RequestLoading());
    try {
      final requests = await requestRepository.getRequests();
      emit(RequestsLoaded(requests: requests));
    } catch (e) {
      emit(RequestError(message: e.toString()));
    }
  }

  Future<void> _onCreateRequest(
      CreateRequest event, Emitter<RequestState> emit) async {
    emit(const RequestLoading());
    try {
      await requestRepository.createRequest(event.request);
      // After creating a request, reload the list so the UI updates.
      final requests = await requestRepository.getRequests();
      emit(RequestsLoaded(requests: requests));
    } catch (e) {
      emit(RequestError(message: e.toString()));
    }
  }
}