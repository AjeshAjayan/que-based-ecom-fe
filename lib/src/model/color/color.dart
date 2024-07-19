import 'package:json_annotation/json_annotation.dart';

part 'color.g.dart';

@JsonSerializable()
class Color {
  final String id;
  final String name;
  final String hexCode;
  final String? createdAt;
  final String? updatedAt;

  Color({
    required this.id,
    required this.name,
    required this.hexCode,
    this.createdAt,
    this.updatedAt,
  });

  factory Color.fromJson(json) => _$ColorFromJson(json);
  Map<String, dynamic> toJson() => _$ColorToJson(this);
}
