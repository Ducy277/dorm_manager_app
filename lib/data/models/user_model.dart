import 'package:equatable/equatable.dart';

/// Data transfer object representing a user.
///
/// This model holds basic information about the signed‑in user. It
/// implements [Equatable] to make comparison operations cheap and
/// predictable. Additional fields can be added as the domain evolves.
class UserModel extends Equatable {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;
  final String dormName;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.avatarUrl,
    required this.dormName,
  });

  /// Construct a [UserModel] from a JSON map.
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      avatarUrl: json['avatarUrl'] as String? ?? '',
      dormName: json['dormName'] as String? ?? '',
    );
  }

  /// Convert the user model into JSON.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'avatarUrl': avatarUrl,
      'dormName': dormName,
    };
  }

  @override
  List<Object?> get props => [id, name, email, avatarUrl, dormName];
}