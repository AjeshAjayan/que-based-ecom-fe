import 'package:json_annotation/json_annotation.dart';
import 'package:que_based_ecom_fe/src/model/payload_description/payload_description.dart';

part 'material.g.dart';

@JsonSerializable()
class Material {
  final String id;
  final String name;
  final PayloadDescription? description;
  final String? createdAt;
  final String? updatedAt;

  Material({
    required this.id,
    required this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory Material.fromJson(json) => _$MaterialFromJson(json);
  Map<String, dynamic> toJson() => _$MaterialToJson(this);
}
