import 'package:json_annotation/json_annotation.dart';
import 'package:que_based_ecom_fe/src/model/color/color.dart';
import 'package:que_based_ecom_fe/src/model/images_and_videos/images_and_videos.dart';
import 'package:que_based_ecom_fe/src/model/material/material.dart';
import 'package:que_based_ecom_fe/src/model/product_image/product_image.dart';
import 'package:que_based_ecom_fe/src/model/product_video/product_video.dart';
import 'package:que_based_ecom_fe/src/model/size/size.dart';

part 'product_variants.g.dart';

@JsonSerializable()
class ProductVariants {
  final String id;
  final Size? size;
  final int quantity;
  final Color? color;
  final String? colorTextToDisplay;
  final List<Material>? materials;
  final List<ImagesAndVideos> imagesAndVideos;
  final bool? isOutOfStock;
  final bool? isSoldOut;
  final bool? isComingSoon;
  final bool? isExclusive;
  final int? variantPrice;

  ProductVariants({
    required this.id,
    this.size,
    required this.quantity,
    this.color,
    this.colorTextToDisplay,
    this.materials,
    required this.imagesAndVideos,
    this.isOutOfStock,
    this.isSoldOut,
    this.isComingSoon,
    this.isExclusive,
    this.variantPrice,
  });

  factory ProductVariants.fromJson(json) => _$ProductVariantsFromJson(json);
  Map<String, dynamic> toJson() => _$ProductVariantsToJson(this);
}
