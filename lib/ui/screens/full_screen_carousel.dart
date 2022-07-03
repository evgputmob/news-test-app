import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_test_app/ui/widgets/carousel_image.dart';

class FullScreenCarousel extends StatefulWidget {
  static const name = 'fullscreencarousel';
  static const path = '/fullscreencarousel/:startIndex';

  final List<String> images;
  final int startIndex;

  const FullScreenCarousel(
      {Key? key, required this.images, required this.startIndex})
      : super(key: key);

  @override
  State<FullScreenCarousel> createState() => _FullScreenCarouselState();
}

class _FullScreenCarouselState extends State<FullScreenCarousel> {
  late final CarouselController _controller = CarouselController();
  //late int _currentCarouselSlide;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    //_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.images.isEmpty) {
      return const Center(child: Text('Нет изображений'));
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Builder(
              builder: (context) {
                final double height = MediaQuery.of(context).size.height;
                return CarouselSlider(
                  carouselController: _controller,
                  options: CarouselOptions(
                    height: height,
                    initialPage: widget.startIndex,
                    viewportFraction: 1.0,
                    enableInfiniteScroll: (widget.images.length > 1),
                  ),
                  items: widget.images
                      .map(
                        (item) => GestureDetector(
                          child: CarouselImage(imagePath: item),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      )
                      .toList(),
                );
              },
            ),
            Positioned(
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Theme.of(context).primaryColor.withOpacity(0.7),
                  size: 36,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              top: 2,
              right: 4,
            )
          ],
        ),
      ),
    );
  }
}
