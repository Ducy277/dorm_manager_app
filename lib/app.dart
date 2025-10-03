import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'core/theme/app_theme.dart';
import 'presentation/routes/app_router.dart';
import 'data/repositories/user_repository.dart';
import 'data/repositories/contract_repository.dart';
import 'data/repositories/room_repository.dart';
import 'data/repositories/request_repository.dart';
import 'data/repositories/complaint_repository.dart';
import 'data/repositories/notification_repository.dart';
import 'services/mock_data_service.dart';

/// Root widget for the KTX application.
///
/// This widget sets up the global theme, routing and dependency
/// injection using the `provider` pattern. It instantiates the
/// repositories with a single [MockDataService] which simulates
/// a backend. When the backend is ready (e.g. using Supabase) the
/// repositories can be updated to use a real data source without
/// affecting the rest of the application.
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  /// Creates a single instance of the [MockDataService] to share across
  /// repositories. In the future this can be replaced with a
  /// Supabase service or any other data source.
  final MockDataService _mockService = MockDataService();

  /// Lazily instantiate the app router. The [AppRouter] holds the
  /// definition of all navigation paths in the application.
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    // Provide repositories at the root of the widget tree. Using
    // MultiRepositoryProvider allows all child widgets to access
    // repositories without manually passing them down.
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>(
            create: (_) => UserRepository(_mockService)),
        RepositoryProvider<ContractRepository>(
            create: (_) => ContractRepository(_mockService)),
        RepositoryProvider<RoomRepository>(
            create: (_) => RoomRepository(_mockService)),
        RepositoryProvider<RequestRepository>(
            create: (_) => RequestRepository(_mockService)),
        RepositoryProvider<ComplaintRepository>(
            create: (_) => ComplaintRepository(_mockService)),
        RepositoryProvider<NotificationRepository>(
            create: (_) => NotificationRepository(_mockService)),
      ],
      child: MaterialApp.router(
        title: 'KTX App',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        routerDelegate: _appRouter.router.routerDelegate,
        routeInformationParser: _appRouter.router.routeInformationParser,
        routeInformationProvider: _appRouter.router.routeInformationProvider,
      ),
    );
  }
}