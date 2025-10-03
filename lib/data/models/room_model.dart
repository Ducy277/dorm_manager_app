import 'package:equatable/equatable.dart';

/// Model representing equipment or furniture within a dorm room.
class FacilityItem extends Equatable {
  final String name;
  final String? model;

  const FacilityItem({required this.name, this.model});

  factory FacilityItem.fromJson(Map<String, dynamic> json) {
    return FacilityItem(
      name: json['name'] as String,
      model: json['model'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'model': model,
    };
  }

  @override
  List<Object?> get props => [name, model];
}

/// Model representing a dorm room including its type, occupants and facilities.
class RoomModel extends Equatable {
  final String id;
  final String name;
  final String type;
  final List<String> roommates;
  final List<FacilityItem> facilities;

  const RoomModel({
    required this.id,
    required this.name,
    required this.type,
    required this.roommates,
    required this.facilities,
  });

  factory RoomModel.fromJson(Map<String, dynamic> json) {
    return RoomModel(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      roommates: List<String>.from(json['roommates'] as List<dynamic>),
      facilities: (json['facilities'] as List<dynamic>)
          .map((e) => FacilityItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'roommates': roommates,
      'facilities': facilities.map((e) => e.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [id, name, type, roommates, facilities];
}