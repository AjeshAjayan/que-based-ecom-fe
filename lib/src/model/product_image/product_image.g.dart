// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductImage _$ProductImageFromJson(Map<String, dynamic> json) => ProductImage(
      id: json['id'] as String,
      altText: json['altText'] as String?,
      filename: json['filename'] as String,
      mimeType: json['mimeType'] as String,
      filesize: (json['filesize'] as num).toInt(),
      width: (json['width'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      focalX: (json['focalX'] as num).toInt(),
      focalY: (json['focalY'] as num).toInt(),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$ProductImageToJson(ProductImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'altText': instance.altText,
      'filename': instance.filename,
      'mimeType': instance.mimeType,
      'filesize': instance.filesize,
      'width': instance.width,
      'height': instance.height,
      'focalX': instance.focalX,
      'focalY': instance.focalY,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'url': instance.url,
    };
