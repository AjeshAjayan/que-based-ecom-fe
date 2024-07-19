// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_variants.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductVariants _$ProductVariantsFromJson(Map<String, dynamic> json) =>
    ProductVariants(
      id: json['id'] as String,
      size: json['size'] == null
          ? null
          : Size.fromJson(json['size'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toInt(),
      color: json['color'] == null ? null : Color.fromJson(json['color']),
      colorTextToDisplay: json['colorTextToDisplay'] as String?,
      materials: (json['materials'] as List<dynamic>?)
          ?.map((e) => Material.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: json['images'] == null
          ? null
          : ProductImage.fromJson(json['images'] as Map<String, dynamic>),
      videos: json['videos'] == null
          ? null
          : ProductVideo.fromJson(json['videos'] as Map<String, dynamic>),
      isOutOfStock: json['isOutOfStock'] as bool?,
      isSoldOut: json['isSoldOut'] as bool?,
      isComingSoon: json['isComingSoon'] as bool?,
      isExclusive: json['isExclusive'] as bool?,
      variantPrice: (json['variantPrice'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductVariantsToJson(ProductVariants instance) =>
    <String, dynamic>{
      'id': instance.id,
      'size': instance.size,
      'quantity': instance.quantity,
      'color': instance.color,
      'colorTextToDisplay': instance.colorTextToDisplay,
      'materials': instance.materials,
      'images': instance.images,
      'videos': instance.videos,
      'isOutOfStock': instance.isOutOfStock,
      'isSoldOut': instance.isSoldOut,
      'isComingSoon': instance.isComingSoon,
      'isExclusive': instance.isExclusive,
      'variantPrice': instance.variantPrice,
    };
