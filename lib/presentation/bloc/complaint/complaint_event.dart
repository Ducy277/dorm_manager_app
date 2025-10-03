part of 'complaint_bloc.dart';

/// Base class for complaint events.
abstract class ComplaintEvent extends Equatable {
  const ComplaintEvent();

  @override
  List<Object?> get props => [];
}

/// Event to load all complaints.
class LoadComplaints extends ComplaintEvent {
  const LoadComplaints();
}

/// Event to create a new complaint.
class CreateComplaint extends ComplaintEvent {
  final ComplaintModel complaint;
  const CreateComplaint(this.complaint);

  @override
  List<Object?> get props => [complaint];
}