import 'package:equatable/equatable.dart';

/// Domain entity for a contract.
class Contract extends Equatable {
  final String id;
  final String name;
  final String status;
  final double price;
  final DateTime startDate;
  final DateTime endDate;

  const Contract({
    required this.id,
    required this.name,
    required this.status,
    required this.price,
    required this.startDate,
    required this.endDate,
  });

  @override
  List<Object?> get props => [id, name, status, price, startDate, endDate];
}