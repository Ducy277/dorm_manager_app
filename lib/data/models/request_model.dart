import 'package:equatable/equatable.dart';

/// Supported types of requests that a student can submit.
enum RequestType { changeRoom, repair, checkout, other }

/// Model representing a service request submitted by a student.
///
/// Each request has a type, description, status and timestamp. The
/// status can be used by administrators to manage workflows (e.g. pending,
/// approved, rejected). Extending [Equatable] simplifies comparisons.
class RequestModel extends Equatable {
  final String id;
  final RequestType type;
  final String description;
  final String status;
  final DateTime createdAt;

  const RequestModel({
    required this.id,
    required this.type,
    required this.description,
    required this.status,
    required this.createdAt,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      id: json['id'] as String,
      type: RequestType.values.firstWhere(
          (e) => e.toString() == json['type'] as String,
          orElse: () => RequestType.other),
      description: json['description'] as String,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.toString(),
      'description': description,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [id, type, description, status, createdAt];
}