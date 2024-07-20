// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubCategory _$SubCategoryFromJson(Map<String, dynamic> json) => SubCategory(
      id: json['id'] as String,
      name: json['name'] as String,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      description: (json['description'] as List<dynamic>?)
          ?.map((e) => PayloadDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubCategoryToJson(SubCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'description': instance.description,
      'category': instance.category,
    };
