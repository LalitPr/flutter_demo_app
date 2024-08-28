import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final String name;
  final double price;
  final String image;
  final String description;

  Product({
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  });

  // Factory method to create a Product from JSON
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  // Method to convert a Product instance to JSON
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
