import 'package:equatable/equatable.dart';

/// Domain entity representing a user request.
///
/// This entity is separate from the data layer model and can include
/// additional validation or behaviour if required. The [type] is kept
/// as a simple string here but could be converted into an enum.
class Request extends Equatable {
  final String id;
  final String type;
  final String description;
  final String status;
  final DateTime createdAt;

  const Request({
    required this.id,
    required this.type,
    required this.description,
    required this.status,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, type, description, status, createdAt];
}