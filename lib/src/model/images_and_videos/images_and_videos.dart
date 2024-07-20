import 'package:json_annotation/json_annotation.dart';
import 'package:que_based_ecom_fe/src/model/product_image/product_image.dart';
import 'package:que_based_ecom_fe/src/model/product_video/product_video.dart';

part 'images_and_videos.g.dart';

@JsonSerializable()
class ImagesAndVideos {
  final String id;
  final ProductImage? image;
  final ProductVideo? video;

  ImagesAndVideos({
    required this.id,
    this.image,
    this.video,
  });

  factory ImagesAndVideos.fromJson(json) => _$ImagesAndVideosFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesAndVideosToJson(this);
}
