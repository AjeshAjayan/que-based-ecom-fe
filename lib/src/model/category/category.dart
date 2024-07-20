import 'package:json_annotation/json_annotation.dart';
import 'package:que_based_ecom_fe/src/model/payload_description/payload_description.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  final String id;
  final String name;
  final List<PayloadDescription>? description;
  final String? createdAt;
  final String? updatedAt;

  Category({
    required this.id,
    required this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
