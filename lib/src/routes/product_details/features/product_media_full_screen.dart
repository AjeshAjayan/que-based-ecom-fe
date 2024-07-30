import 'package:flutter/material.dart';
import 'package:que_based_ecom_fe/src/widgets/q_product_media_carousel.dart';

class ProductMediaFullScreen extends StatelessWidget {
  const ProductMediaFullScreen({super.key, required this.mediaURLs});
  final List<String> mediaURLs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: QProductMediaCarousel(
          mediaURLs: mediaURLs,
          cover: false,
          enlargeCenterPage: true,
          viewportFraction: 0.8,
          initialPage: 1,
        ),
      ),
    );
  }
}
