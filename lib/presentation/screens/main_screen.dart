import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/app_strings.dart';
import '../bloc/home/home_bloc.dart';
import '../bloc/room/room_bloc.dart';
import '../bloc/notification/notification_bloc.dart';
import '../bloc/profile/profile_bloc.dart';
import '../bloc/request/request_bloc.dart';
import '../bloc/complaint/complaint_bloc.dart';
import '../bloc/contract/contract_bloc.dart';
import '../../data/repositories/user_repository.dart';
import '../../data/repositories/room_repository.dart';
import '../../data/repositories/notification_repository.dart';
import '../../data/repositories/contract_repository.dart';
import '../../data/repositories/request_repository.dart';
import '../../data/repositories/complaint_repository.dart';

import 'home/home_screen.dart';
import 'room/room_detail_screen.dart';
import 'notification/notification_screen.dart';
import 'profile/profile_screen.dart';

/// The main scaffold containing the bottom navigation bar and the
/// four primary pages: Home, My Room, Notifications and Profile.
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Pages are created lazily within IndexedStack so that their state
    // persists when switching tabs. Each page is wrapped in the
    // appropriate bloc providers.
    final pages = [
      // Home page with its own bloc providers
      MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
            create: (context) => HomeBloc(
              userRepository: context.read<UserRepository>(),
              contractRepository: context.read<ContractRepository>(),
              roomRepository: context.read<RoomRepository>(),
            )..add(const LoadHomeData()),
          ),
        ],
        child: const HomeScreen(),
      ),
      // My Room
      BlocProvider<RoomBloc>(
        create: (context) => RoomBloc(
          roomRepository: context.read<RoomRepository>(),
        )..add(const LoadRoom()),
        child: const RoomDetailScreen(),
      ),
      // Notifications
      BlocProvider<NotificationBloc>(
        create: (context) => NotificationBloc(
          notificationRepository: context.read<NotificationRepository>(),
        )..add(const LoadNotifications()),
        child: const NotificationScreen(),
      ),
      // Profile
      BlocProvider<ProfileBloc>(
        create: (context) => ProfileBloc(
          userRepository: context.read<UserRepository>(),
        )..add(const LoadProfile()),
        child: const ProfileScreen(),
      ),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AppStrings.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.meeting_room_outlined),
            label: AppStrings.myRoom,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: AppStrings.notifications,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: AppStrings.profile,
          ),
        ],
      ),
    );
  }
}