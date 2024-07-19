// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      title: json['title'] as String,
      id: json['id'] as String,
      price: (json['price'] as num).toInt(),
      moq: (json['moq'] as num).toInt(),
      productAddedDate: json['productAddedDate'] as String,
      expiryDate: json['expiryDate'] as String?,
      isOutOfStock: json['isOutOfStock'] as bool?,
      isQueueFull: json['isQueueFull'] as bool?,
      isSoldOut: json['isSoldOut'] as bool?,
      isHotSelling: json['isHotSelling'] as bool?,
      isFromBestSeller: json['isFromBestSeller'] as bool?,
      isFeatured: json['isFeatured'] as bool?,
      isNewProduct: json['isNewProduct'] as bool?,
      isSpecialOffer: json['isSpecialOffer'] as bool?,
      isBestValue: json['isBestValue'] as bool?,
      isTimeLimitedOffer: json['isTimeLimitedOffer'] as bool?,
      isComingSoon: json['isComingSoon'] as bool?,
      isExclusive: json['isExclusive'] as bool?,
      isLimitedTimeSale: json['isLimitedTimeSale'] as bool?,
      isPopular: json['isPopular'] as bool?,
      isBestSeller: json['isBestSeller'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ProductImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      videos: (json['videos'] as List<dynamic>?)
          ?.map((e) => ProductVideo.fromJson(e as Map<String, dynamic>))
          .toList(),
      subCategory: (json['subCategory'] as List<dynamic>)
          .map((e) => SubCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: (json['description'] as List<dynamic>?)
          ?.map((e) => PayloadDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      variants: (json['variants'] as List<dynamic>?)
          ?.map(ProductVariants.fromJson)
          .toList(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'moq': instance.moq,
      'expiryDate': instance.expiryDate,
      'productAddedDate': instance.productAddedDate,
      'isOutOfStock': instance.isOutOfStock,
      'isQueueFull': instance.isQueueFull,
      'isSoldOut': instance.isSoldOut,
      'isHotSelling': instance.isHotSelling,
      'isFromBestSeller': instance.isFromBestSeller,
      'isFeatured': instance.isFeatured,
      'isNewProduct': instance.isNewProduct,
      'isBestSeller': instance.isBestSeller,
      'isSpecialOffer': instance.isSpecialOffer,
      'isBestValue': instance.isBestValue,
      'isTimeLimitedOffer': instance.isTimeLimitedOffer,
      'isComingSoon': instance.isComingSoon,
      'isExclusive': instance.isExclusive,
      'isLimitedTimeSale': instance.isLimitedTimeSale,
      'isPopular': instance.isPopular,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'images': instance.images,
      'videos': instance.videos,
      'subCategory': instance.subCategory,
      'description': instance.description,
      'variants': instance.variants,
    };
