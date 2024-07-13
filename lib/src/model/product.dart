import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final String title;

  Product(this.title);

  factory Product.fromJSON(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJSON() => _$ProductToJson(this);
}
