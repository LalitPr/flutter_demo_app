// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      name: json['name'] as String,
      price: _parsePrice(json['price']),
      image: json['image'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'image': instance.image,
      'description': instance.description,
    };

// Helper method to parse the price field
double _parsePrice(dynamic price) {
  if (price is String) {
    return double.tryParse(price) ?? 0.0;
  } else if (price is num) {
    return price.toDouble();
  } else {
    return 0.0;
  }
}
