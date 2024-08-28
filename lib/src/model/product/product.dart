import 'package:json_annotation/json_annotation.dart';
import 'package:que_based_ecom_fe/src/model/images_and_videos/images_and_videos.dart';
import 'package:que_based_ecom_fe/src/model/payload_description/payload_description.dart';
import 'package:que_based_ecom_fe/src/model/product_variants/product_variants.dart';
import 'package:que_based_ecom_fe/src/model/sub_category/sub_category.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: '_id')
  final String id;
  final String title;
  final int price;
  final int moq;
  final String? expiryDate;
  final String productAddedDate;
  final bool? isOutOfStock;
  final bool? isQueueFull;
  final bool? isSoldOut;
  final bool? isHotSelling;
  final bool? isFromBestSeller;
  final bool? isFeatured;
  final bool? isNewProduct;
  final bool? isBestSeller;
  final bool? isSpecialOffer;
  final bool? isBestValue;
  final bool? isTimeLimitedOffer;
  final bool? isComingSoon;
  final bool? isExclusive;
  final bool? isLimitedTimeSale;
  final bool? isPopular;
  final String? createdAt;
  final String? updatedAt;

  final List<ImagesAndVideos> imagesAndVideos;
  final List<SubCategory> subCategory;
  final List<PayloadDescription>? description;
  final List<ProductVariants>? variants;

  Product({
    required this.title,
    required this.id,
    required this.price,
    required this.moq,
    required this.productAddedDate,
    this.expiryDate,
    this.isOutOfStock,
    this.isQueueFull,
    this.isSoldOut,
    this.isHotSelling,
    this.isFromBestSeller,
    this.isFeatured,
    this.isNewProduct,
    this.isSpecialOffer,
    this.isBestValue,
    this.isTimeLimitedOffer,
    this.isComingSoon,
    this.isExclusive,
    this.isLimitedTimeSale,
    this.isPopular,
    this.isBestSeller,
    this.createdAt,
    this.updatedAt,
    required this.imagesAndVideos,
    required this.subCategory,
    this.description,
    this.variants,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJSON() => _$ProductToJson(this);
}
