import 'package:equatable/equatable.dart';

/// Data transfer object representing a contract between the student and the dormitory.
class ContractModel extends Equatable {
  final String id;
  final String name;
  final String status; // e.g. 'Đang hiệu lực', 'Hết hạn'
  final double price;
  final DateTime startDate;
  final DateTime endDate;

  const ContractModel({
    required this.id,
    required this.name,
    required this.status,
    required this.price,
    required this.startDate,
    required this.endDate,
  });

  factory ContractModel.fromJson(Map<String, dynamic> json) {
    return ContractModel(
      id: json['id'] as String,
      name: json['name'] as String,
      status: json['status'] as String,
      price: (json['price'] as num).toDouble(),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'price': price,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [id, name, status, price, startDate, endDate];
}