import 'package:equatable/equatable.dart';

/// Domain entity representing a facility item in a dorm room.
class Facility extends Equatable {
  final String name;
  final String? model;

  const Facility({required this.name, this.model});

  @override
  List<Object?> get props => [name, model];
}

/// Domain entity for a dorm room.
class Room extends Equatable {
  final String id;
  final String name;
  final String type;
  final List<String> roommates;
  final List<Facility> facilities;

  const Room({
    required this.id,
    required this.name,
    required this.type,
    required this.roommates,
    required this.facilities,
  });

  @override
  List<Object?> get props => [id, name, type, roommates, facilities];
}