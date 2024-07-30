import 'package:que_based_ecom_fe/src/model/product/product.dart';

class Media {
  List<String> images;
  List<String> videos;

  Media({
    required this.images,
    required this.videos,
  });
}

Media findAllMediasFromProduct(Product product) {
  /**
     * get images and videos from top level
     */
  final images = product.imagesAndVideos
      .map((media) => media.image?.url ?? '')
      .where((url) => url != '')
      .toList();

  final videos = product.imagesAndVideos
      .map((media) => media.video?.url ?? '')
      .where((url) => url != '')
      .toList();
  /**
     * END: get images and videos from top level
     */

  /**
     * get images and videos from all variant levels
     */
  product.variants?.asMap().entries.map((entries) {
    final variant = entries.value;
    final imageUrls = variant.imagesAndVideos
        .map((media) => media.image?.url ?? '')
        .where((url) => url != '')
        .toList();
    final videoUrls = variant.imagesAndVideos
        .map((media) => media.video?.url ?? '')
        .where((url) => url != '')
        .toList();

    images.addAll(imageUrls);
    videos.addAll(videoUrls);
  });
  /**
     * END: get images and videos from all variant levels
     */

  return Media(images: images, videos: videos);
}
