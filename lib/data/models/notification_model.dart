import 'package:equatable/equatable.dart';

/// Categories of notifications that the system can emit.
///
/// These values can be used to filter the notification list in the
/// notification screen. When integrating with the backend the string
/// representation should be consistent.
enum NotificationType { request, complaint, system, other }

/// Model representing a notification sent to the student.
class NotificationModel extends Equatable {
  final String id;
  final String title;
  final String body;
  final NotificationType type;
  final DateTime date;

  const NotificationModel({
    required this.id,
    required this.title,
    required this.body,
    required this.type,
    required this.date,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      type: NotificationType.values.firstWhere(
          (e) => e.toString() == json['type'] as String,
          orElse: () => NotificationType.other),
      date: DateTime.parse(json['date'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'type': type.toString(),
      'date': date.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [id, title, body, type, date];
}