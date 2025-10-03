/// A collection of simple validation helpers.
///
/// As the application grows, more complex validation logic can be
/// incorporated here. Keeping validation separate from the widgets
/// themselves makes unit testing easier.
class Validators {
  Validators._();

  static final RegExp _emailRegExp = RegExp(
    r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}\$',
  );

  /// Validate that a string looks like an email address.
  static bool isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  /// Ensure that a string contains at least one non‑whitespace character.
  static bool isNotEmpty(String value) {
    return value.trim().isNotEmpty;
  }
}