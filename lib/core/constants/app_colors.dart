import 'package:flutter/material.dart';

/// A collection of strongly typed color definitions for the app.
///
/// Defining colors in a central place makes it easy to adjust the
/// palette or implement light/dark themes. Colors are kept simple and
/// descriptive rather than tying them to a specific widget.
class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF00695C);
  static const Color secondary = Color(0xFF00897B);
  static const Color accent = Color(0xFF26A69A);
  static const Color background = Color(0xFFF5F5F5);
  static const Color surface = Colors.white;
  static const Color error = Color(0xFFD32F2F);

  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color divider = Color(0xFFBDBDBD);
}