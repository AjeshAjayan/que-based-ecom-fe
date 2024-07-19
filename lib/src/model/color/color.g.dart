// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Color _$ColorFromJson(Map<String, dynamic> json) => Color(
      id: json['id'] as String,
      name: json['name'] as String,
      hexCode: json['hexCode'] as String,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$ColorToJson(Color instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'hexCode': instance.hexCode,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
