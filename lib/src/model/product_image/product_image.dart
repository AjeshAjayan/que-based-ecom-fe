import 'package:json_annotation/json_annotation.dart';

part 'product_image.g.dart';

@JsonSerializable()
class ProductImage {
  final String id;
  final String? altText;
  final String filename;
  final String mimeType;
  final int filesize;
  final int width;
  final int height;
  final int focalX;
  final int focalY;
  final String createdAt;
  final String updatedAt;
  final String url;

  ProductImage({
    required this.id,
    required this.altText,
    required this.filename,
    required this.mimeType,
    required this.filesize,
    required this.width,
    required this.height,
    required this.focalX,
    required this.focalY,
    required this.createdAt,
    required this.updatedAt,
    required this.url,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) =>
      _$ProductImageFromJson(json);

  Map<String, dynamic> toJson() => _$ProductImageToJson(this);
}
