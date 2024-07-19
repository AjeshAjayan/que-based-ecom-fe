import 'package:json_annotation/json_annotation.dart';
import 'package:que_based_ecom_fe/src/model/category/category.dart';
import 'package:que_based_ecom_fe/src/model/payload_description/payload_description.dart';

part 'sub_category.g.dart';

@JsonSerializable()
class SubCategory {
  final String id;
  final String name;
  final String? createdAt;
  final String? updatedAt;

  final PayloadDescription? description;
  final Category? category;

  SubCategory({
    required this.id,
    required this.name,
    this.createdAt,
    this.updatedAt,
    this.description,
    this.category,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$SubCategoryToJson(this);
}
