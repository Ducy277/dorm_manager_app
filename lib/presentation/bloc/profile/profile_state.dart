part of 'profile_bloc.dart';

/// Base state for the profile feature.
abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

/// Initial state before the profile is loaded.
class ProfileInitial extends ProfileState {
  const ProfileInitial();
}

/// Loading state while the profile is being retrieved.
class ProfileLoading extends ProfileState {
  const ProfileLoading();
}

/// Loaded state containing the current user's profile.
class ProfileLoaded extends ProfileState {
  final UserModel user;
  const ProfileLoaded({required this.user});

  @override
  List<Object?> get props => [user];
}

/// Error state when loading the profile fails.
class ProfileError extends ProfileState {
  final String message;
  const ProfileError({required this.message});

  @override
  List<Object?> get props => [message];
}