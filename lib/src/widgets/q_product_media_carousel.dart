import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:que_based_ecom_fe/src/constants.dart';
import 'package:que_based_ecom_fe/src/widgets/q_product_video.dart';

class QProductMediaCarousel extends StatefulWidget {
  const QProductMediaCarousel({
    super.key,
    required this.mediaURLs,
    this.cover = true,
    this.enlargeCenterPage = false,
    this.viewportFraction = 1,
    this.initialPage = 0,
  });

  final List<String> mediaURLs;
  final bool cover;
  final bool enlargeCenterPage;
  final double viewportFraction;
  final int initialPage;

  @override
  State<QProductMediaCarousel> createState() => _QProductMediaCarouselState();
}

class _QProductMediaCarouselState extends State<QProductMediaCarousel> {
  final CarouselController _controller = CarouselController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: widget.mediaURLs.toList().map(
            (url) {
              if (url.contains('mp4')) {
                return QProductVideo(
                    networkURL: assetUrl + url,
                    onError: () {
                      _controller.nextPage();
                    });
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.network(
                      assetUrl + url,
                      fit: widget.cover ? BoxFit.cover : BoxFit.contain,
                    ),
                  ),
                ],
              );
            },
          ).toList(),
          carouselController: _controller,
          options: CarouselOptions(
            initialPage: widget.initialPage,
            viewportFraction: widget.viewportFraction,
            enableInfiniteScroll: false,
            autoPlay: false,
            enlargeCenterPage: widget.enlargeCenterPage,
            aspectRatio: widget.cover ? 1.33 : 0.8,
            onPageChanged: (index, reason) {
              _current = index;

              setState(() {
                _current = index;
              });
            },
          ),
        ),
        Visibility(
          visible: widget.mediaURLs.length > 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.mediaURLs.asMap().entries.map(
              (entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 4.0,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                          .withOpacity(
                        _current == entry.key ? 0.9 : 0.4,
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
