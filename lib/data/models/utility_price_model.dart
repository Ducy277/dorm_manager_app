import 'package:equatable/equatable.dart';

/// Model representing the cost of a particular utility or service.
///
/// Examples include room rent, electricity, water or internet. Costs are
/// stored as doubles but could be further expanded to include units or
/// currency if needed.
class UtilityPriceModel extends Equatable {
  final String name;
  final double price;

  const UtilityPriceModel({required this.name, required this.price});

  factory UtilityPriceModel.fromJson(Map<String, dynamic> json) {
    return UtilityPriceModel(
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
    };
  }

  @override
  List<Object?> get props => [name, price];
}