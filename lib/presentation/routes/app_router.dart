import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/main_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/contract/contract_list_screen.dart';
import '../screens/contract/contract_detail_screen.dart';
import '../screens/request/request_list_screen.dart';
import '../screens/request/create_request_screen.dart';
import '../screens/complaint/complaint_list_screen.dart';
import '../screens/complaint/create_complaint_screen.dart';
import '../screens/room/room_detail_screen.dart';
import '../screens/notification/notification_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/profile/personal_info_screen.dart';
import '../screens/profile/settings_screen.dart';
import '../screens/parking/parking_screen.dart';
import '../../data/repositories/request_repository.dart';
import '../../data/repositories/complaint_repository.dart';
import '../bloc/request/request_bloc.dart';
import '../bloc/complaint/complaint_bloc.dart';
import '../bloc/profile/profile_bloc.dart';

/// Encapsulates all route definitions for the application.
class AppRouter {
  AppRouter();

  /// Build the router with a flat list of routes. Nested navigation could
  /// be used for more complex flows but is not necessary here.
  final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: '/contracts',
        builder: (context, state) => const ContractListScreen(),
      ),
      GoRoute(
        path: '/contracts/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          //final id = state.params['id']!;
          return ContractDetailScreen(contractId: id);
        },
      ),
      GoRoute(
        path: '/requests',
        builder: (context, state) => const RequestListScreen(),
      ),
      GoRoute(
        path: '/requests/create',
        builder: (context, state) {
          final extra = state.extra;
          if (extra is RequestBloc) {
            // Reuse the existing bloc instance
            return BlocProvider<RequestBloc>.value(
              value: extra,
              child: const CreateRequestScreen(),
            );
          }
          // Otherwise create a new bloc (e.g. if navigated from quick action)
          return BlocProvider(
            create: (context) => RequestBloc(
              requestRepository: context.read<RequestRepository>(),
            ),
            child: const CreateRequestScreen(),
          );
        },
      ),
      GoRoute(
        path: '/complaints',
        builder: (context, state) => const ComplaintListScreen(),
      ),
      GoRoute(
        path: '/complaints/create',
        builder: (context, state) {
          final extra = state.extra;
          if (extra is ComplaintBloc) {
            return BlocProvider<ComplaintBloc>.value(
              value: extra,
              child: const CreateComplaintScreen(),
            );
          }
          return BlocProvider(
            create: (context) => ComplaintBloc(
              complaintRepository: context.read<ComplaintRepository>(),
            ),
            child: const CreateComplaintScreen(),
          );
        },
      ),
      GoRoute(
        path: '/room',
        builder: (context, state) => const RoomDetailScreen(),
      ),
      GoRoute(
        path: '/notifications',
        builder: (context, state) => const NotificationScreen(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: '/profile/info',
        builder: (context, state) {
          // Reuse the existing ProfileBloc if available
          final bloc = BlocProvider.of<ProfileBloc>(context);
          return BlocProvider<ProfileBloc>.value(
            value: bloc,
            child: const PersonalInfoScreen(),
          );
        },
      ),
      GoRoute(
        path: '/profile/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/parking',
        builder: (context, state) => const ParkingScreen(),
      ),
    ],
  );
}