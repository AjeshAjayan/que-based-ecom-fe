// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'images_and_videos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImagesAndVideos _$ImagesAndVideosFromJson(Map<String, dynamic> json) =>
    ImagesAndVideos(
      id: json['id'] as String,
      image: json['image'] == null
          ? null
          : ProductImage.fromJson(json['image'] as Map<String, dynamic>),
      video: json['video'] == null
          ? null
          : ProductVideo.fromJson(json['video'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImagesAndVideosToJson(ImagesAndVideos instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'video': instance.video,
    };
