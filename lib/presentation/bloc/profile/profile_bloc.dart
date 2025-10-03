import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/user_model.dart';
import '../../../data/repositories/user_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

/// Bloc to manage the user's profile information.
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository userRepository;

  ProfileBloc({required this.userRepository}) : super(const ProfileInitial()) {
    on<LoadProfile>(_onLoadProfile);
  }

  Future<void> _onLoadProfile(
      LoadProfile event, Emitter<ProfileState> emit) async {
    emit(const ProfileLoading());
    try {
      final user = await userRepository.getCurrentUser();
      emit(ProfileLoaded(user: user));
    } catch (e) {
      emit(ProfileError(message: e.toString()));
    }
  }
}