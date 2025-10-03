part of 'profile_bloc.dart';

/// Base class for profile events.
abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

/// Event to load the current user's profile.
class LoadProfile extends ProfileEvent {
  const LoadProfile();
}