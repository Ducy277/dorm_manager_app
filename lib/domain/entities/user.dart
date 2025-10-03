import 'package:equatable/equatable.dart';

/// A user entity representing a student in the domain layer.
///
/// Entities define the core business objects independent of any
/// persistence or presentation concerns. They can map to models in the
/// data layer but are decoupled to allow for validation and domain
/// behaviour in more complex applications.
class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;
  final String dormName;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.avatarUrl,
    required this.dormName,
  });

  @override
  List<Object?> get props => [id, name, email, avatarUrl, dormName];
}