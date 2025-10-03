import 'package:intl/intl.dart';

/// Utility for formatting dates consistently throughout the app.
///
/// The [`intl`](https://pub.dev/packages/intl) package provides robust
/// formatting facilities for dates, numbers and messages. Here we wrap
/// a simple date formatter to hide the implementation details and to
/// centralize the chosen format string.
class DateFormatter {
  DateFormatter._();

  static final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');

  /// Format a [DateTime] into a human‐readable string.
  static String formatDate(DateTime date) {
    return _dateFormat.format(date);
  }
}