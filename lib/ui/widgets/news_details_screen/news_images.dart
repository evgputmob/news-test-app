import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_test_app/ui/screens/full_screen_carousel.dart';
import 'package:news_test_app/ui/widgets/carousel_image.dart';

class NewsImages extends StatefulWidget {
  final List<String> images;

  const NewsImages({Key? key, required this.images}) : super(key: key);

  @override
  State<NewsImages> createState() => _NewsImagesState();
}

class _NewsImagesState extends State<NewsImages> {
  final CarouselController _controller = CarouselController();
  int _currentCarouselSlide = 0;

  @override
  void dispose() {
    //_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.images.isEmpty) {
      return const SizedBox.shrink();
    }
    //---
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 13),
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
            height: 200,
            viewportFraction: 1.0,
            enlargeCenterPage: true,
            enableInfiniteScroll: (widget.images.length > 1),
            onPageChanged: (index, reason) {
              setState(() {
                _currentCarouselSlide = index;
              });
            },
          ),
          items: widget.images
              .map(
                (item) => GestureDetector(
                  child: CarouselImage(imagePath: item),
                  onTap: () {
                    context.pushNamed(
                      FullScreenCarousel.name,
                      extra: widget.images,
                      params: {'startIndex': _currentCarouselSlide.toString()},
                    );
                  },
                ),
              )
              .toList(),
        ),
        if (widget.images.length > 1) const SizedBox(height: 12),
        if (widget.images.length > 1)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SizedBox(
              height: 11,
              child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widget.images.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 11,
                        height: 11,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(
                            _currentCarouselSlide == entry.key ? 0.9 : 0.2,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        const SizedBox(height: 14),
      ],
    );
  }
}
