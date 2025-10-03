import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/complaint_model.dart';
import '../../../data/repositories/complaint_repository.dart';

part 'complaint_event.dart';
part 'complaint_state.dart';

/// Bloc that handles user complaints.
class ComplaintBloc extends Bloc<ComplaintEvent, ComplaintState> {
  final ComplaintRepository complaintRepository;

  ComplaintBloc({required this.complaintRepository})
      : super(const ComplaintInitial()) {
    on<LoadComplaints>(_onLoadComplaints);
    on<CreateComplaint>(_onCreateComplaint);
  }

  Future<void> _onLoadComplaints(
      LoadComplaints event, Emitter<ComplaintState> emit) async {
    emit(const ComplaintLoading());
    try {
      final complaints = await complaintRepository.getComplaints();
      emit(ComplaintsLoaded(complaints: complaints));
    } catch (e) {
      emit(ComplaintError(message: e.toString()));
    }
  }

  Future<void> _onCreateComplaint(
      CreateComplaint event, Emitter<ComplaintState> emit) async {
    emit(const ComplaintLoading());
    try {
      await complaintRepository.createComplaint(event.complaint);
      final complaints = await complaintRepository.getComplaints();
      emit(ComplaintsLoaded(complaints: complaints));
    } catch (e) {
      emit(ComplaintError(message: e.toString()));
    }
  }
}