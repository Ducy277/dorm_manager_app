/// A set of commonly used spacing constants.
///
/// Using named sizes rather than magic numbers makes layouts easier to
/// adjust and provides consistency across the app. Sizes roughly follow
/// a scale of multiples of eight which aligns well with Material
/// Design guidelines.
class AppSizes {
  AppSizes._();

  static const double xs = 4.0;
  static const double s = 8.0;
  static const double m = 16.0;
  static const double l = 24.0;
  static const double xl = 32.0;

  /// Standard card border radius used throughout the app.
  static const double borderRadius = 12.0;
}