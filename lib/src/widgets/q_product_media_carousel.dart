import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class QProductMediaCarousel extends StatefulWidget {
  const QProductMediaCarousel({super.key, required this.mediaURLs});

  final List<String> mediaURLs;

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
          items: widget.mediaURLs.toList().map((item) => Text(item)).toList(),
          carouselController: _controller,
          options: CarouselOptions(
            autoPlay: false,
            enlargeCenterPage: true,
            aspectRatio: 1.33,
            onPageChanged: (index, reason) {
              _current = index;

              setState(() {
                _current = index;
              });
            },
          ),
        ),
        Row(
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
      ],
    );
  }
}
