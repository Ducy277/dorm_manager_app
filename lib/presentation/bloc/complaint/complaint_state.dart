part of 'complaint_bloc.dart';

/// Base state for the complaint bloc.
abstract class ComplaintState extends Equatable {
  const ComplaintState();

  @override
  List<Object?> get props => [];
}

/// Initial state before loading complaints.
class ComplaintInitial extends ComplaintState {
  const ComplaintInitial();
}

/// Loading state for complaints.
class ComplaintLoading extends ComplaintState {
  const ComplaintLoading();
}

/// Loaded state containing a list of complaints.
class ComplaintsLoaded extends ComplaintState {
  final List<ComplaintModel> complaints;
  const ComplaintsLoaded({required this.complaints});

  @override
  List<Object?> get props => [complaints];
}

/// Error state when fetching or creating complaints fails.
class ComplaintError extends ComplaintState {
  final String message;
  const ComplaintError({required this.message});

  @override
  List<Object?> get props => [message];
}