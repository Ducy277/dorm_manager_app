import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

/// Defines the visual theme of the application.
///
/// Themes are defined as static properties so they can be easily passed
/// into MaterialApp. The light and dark themes share common values
/// where appropriate but override colors to suit their respective
/// brightness.
class AppTheme {
  AppTheme._();

  /// The default light theme used throughout the app.
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      error: AppColors.error,
    ),
    scaffoldBackgroundColor: AppColors.background,
    cardColor: AppColors.surface,
    dividerColor: AppColors.divider,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16.0, color: AppColors.textPrimary),
      bodyMedium: TextStyle(fontSize: 14.0, color: AppColors.textPrimary),
      bodySmall: TextStyle(fontSize: 12.0, color: AppColors.textSecondary),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        minimumSize: const Size.fromHeight(48.0),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
  );

  /// A basic dark theme. The dark palette is intentionally simple; in a
  /// real application you may want to further customize surfaces,
  /// backgrounds and typography.
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      error: AppColors.error,
    ),
    scaffoldBackgroundColor: Colors.black,
    cardColor: const Color(0xFF1E1E1E),
    dividerColor: AppColors.divider,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16.0, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 14.0, color: Colors.white70),
      bodySmall: TextStyle(fontSize: 12.0, color: Colors.white60),
    ),
  );
}