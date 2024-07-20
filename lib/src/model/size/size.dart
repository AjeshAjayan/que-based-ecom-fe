import 'package:json_annotation/json_annotation.dart';
import 'package:que_based_ecom_fe/src/model/payload_description/payload_description.dart';

part 'size.g.dart';

@JsonSerializable()
class Size {
  final String id;
  final String name;
  final List<PayloadDescription>? description;
  final String? createdAt;
  final String? updatedAt;

  Size({
    required this.id,
    required this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory Size.fromJson(json) => _$SizeFromJson(json);
  Map<String, dynamic> toJson() => _$SizeToJson(this);
}
