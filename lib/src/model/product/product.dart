import 'package:json_annotation/json_annotation.dart';
import 'package:que_based_ecom_fe/src/model/product_image/product_image.dart';
import 'package:que_based_ecom_fe/src/model/product_video/product_video.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
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

  final List<ProductImage> images;

  final List<ProductVideo>? videos;

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
    required this.images,
    this.videos,
  });

  factory Product.fromJSON(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJSON() => _$ProductToJson(this);
}
