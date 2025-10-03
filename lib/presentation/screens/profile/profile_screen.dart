import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/loading_indicator.dart';
import '../../bloc/profile/profile_bloc.dart';
//import '../../bloc/profile/profile_state.dart';
import 'widgets/profile_header.dart';
import 'widgets/profile_menu_item.dart';

/// Screen displaying the user's profile information and menu options.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang cá nhân'),
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading || state is ProfileInitial) {
            return const LoadingIndicator();
          } else if (state is ProfileLoaded) {
            final user = state.user;
            return ListView(
              children: [
                ProfileHeader(user: user),
                const SizedBox(height: 16.0),
                ProfileMenuItem(
                  icon: Icons.person_outline,
                  label: 'Thông tin cá nhân',
                  onTap: () {
                    context.push('/profile/info');
                  },
                ),
                ProfileMenuItem(
                  icon: Icons.settings_outlined,
                  label: 'Cài đặt',
                  onTap: () {
                    context.push('/profile/settings');
                  },
                ),
              ],
            );
          } else if (state is ProfileError) {
            return Center(child: Text('Lỗi: ${state.message}'));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}