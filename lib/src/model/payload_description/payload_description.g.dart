// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payload_description.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayloadDescription _$PayloadDescriptionFromJson(Map<String, dynamic> json) =>
    PayloadDescription(
      children: (json['children'] as List<dynamic>)
          .map((e) =>
              PayloadDescriptionChild.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PayloadDescriptionToJson(PayloadDescription instance) =>
    <String, dynamic>{
      'children': instance.children,
    };

PayloadDescriptionChild _$PayloadDescriptionChildFromJson(
        Map<String, dynamic> json) =>
    PayloadDescriptionChild(
      text: json['text'] as String,
      bold: json['bold'] as bool?,
    );

Map<String, dynamic> _$PayloadDescriptionChildToJson(
        PayloadDescriptionChild instance) =>
    <String, dynamic>{
      'text': instance.text,
      'bold': instance.bold,
    };
