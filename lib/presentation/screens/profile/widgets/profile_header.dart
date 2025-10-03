import 'package:flutter/material.dart';

import '../../../../data/models/user_model.dart';

/// A prominent header showing the user's avatar and name.
class ProfileHeader extends StatelessWidget {
  final UserModel user;
  const ProfileHeader({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      alignment: Alignment.center,
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: user.avatarUrl.isNotEmpty
                ? NetworkImage(user.avatarUrl)
                : null,
            child: user.avatarUrl.isEmpty
                ? Text(
                    user.name.isNotEmpty ? user.name[0] : '',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: Colors.white),
                  )
                : null,
          ),
          const SizedBox(height: 16.0),
          Text(
            user.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 4.0),
          Text(
            user.email,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}