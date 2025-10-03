import 'package:equatable/equatable.dart';

/// Model representing a complaint submitted by a student.
class ComplaintModel extends Equatable {
  final String id;
  final String title;
  final String description;
  final String status; // e.g. 'Đang xử lý', 'Đã giải quyết'
  final DateTime createdAt;

  const ComplaintModel({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.createdAt,
  });

  factory ComplaintModel.fromJson(Map<String, dynamic> json) {
    return ComplaintModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [id, title, description, status, createdAt];
}