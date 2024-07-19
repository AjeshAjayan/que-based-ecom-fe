import 'package:json_annotation/json_annotation.dart';

part 'payload_description.g.dart';

@JsonSerializable()
class PayloadDescription {
  final List<PayloadDescriptionChild> children;

  PayloadDescription({
    required this.children,
  });

  factory PayloadDescription.fromJson(Map<String, dynamic> json) =>
      _$PayloadDescriptionFromJson(json);
  Map<String, dynamic> toJson() => _$PayloadDescriptionToJson(this);
}

@JsonSerializable()
class PayloadDescriptionChild {
  final String text;
  final bool? bold;

  PayloadDescriptionChild({
    required this.text,
    this.bold,
  });

  factory PayloadDescriptionChild.fromJson(Map<String, dynamic> json) =>
      _$PayloadDescriptionChildFromJson(json);
  Map<String, dynamic> toJson() => _$PayloadDescriptionChildToJson(this);
}
