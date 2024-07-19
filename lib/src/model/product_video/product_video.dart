import 'package:json_annotation/json_annotation.dart';

part 'product_video.g.dart';

@JsonSerializable()
class ProductVideo {
  final String id;
  final String filename;
  final String mimeType;
  final int filesize;
  final String createdAt;
  final String updatedAt;
  final String url;

  ProductVideo({
    required this.id,
    required this.filename,
    required this.mimeType,
    required this.filesize,
    required this.createdAt,
    required this.updatedAt,
    required this.url,
  });

  factory ProductVideo.fromJson(Map<String, dynamic> json) =>
      _$ProductVideoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductVideoToJson(this);
}
