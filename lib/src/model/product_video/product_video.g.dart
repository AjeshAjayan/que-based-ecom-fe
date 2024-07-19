// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductVideo _$ProductVideoFromJson(Map<String, dynamic> json) => ProductVideo(
      id: json['id'] as String,
      filename: json['filename'] as String,
      mimeType: json['mimeType'] as String,
      filesize: (json['filesize'] as num).toInt(),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$ProductVideoToJson(ProductVideo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'filename': instance.filename,
      'mimeType': instance.mimeType,
      'filesize': instance.filesize,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'url': instance.url,
    };
