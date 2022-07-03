import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_test_app/=models=/news.dart';
import 'package:news_test_app/ui/constants.dart';
import 'package:news_test_app/ui/screens/image_preview_screen.dart';
import 'package:news_test_app/ui/utils.dart';

class NewsHeaderWithImage extends StatelessWidget {
  final News news;

  const NewsHeaderWithImage({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double imgWidth = 0.2 * screenWidth;
    if (imgWidth < 70) {
      imgWidth = 70;
    }
    if (imgWidth > 120) {
      imgWidth = 120;
    }

    return Container(
      color: Theme.of(context).primaryColor.withOpacity(0.2),
      constraints: BoxConstraints(
          minHeight: imgWidth + 1.5 * NewsHeaderParams.kTopPadding),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              alignment: Alignment.topLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: NewsHeaderParams.kHorizPadding,
                  vertical: NewsHeaderParams.kVertPadding,
                ),
                width: imgWidth,
                child: Hero(
                  tag: heroNewsImageTag(news.id),
                  child: GestureDetector(
                    onTap: () {
                      if ((news.mainImagePath != null) &&
                          (news.mainImagePath!.isNotEmpty)) {
                        context.pushNamed(
                          ImagePreviewScreen.name,
                          params: {'imagePath': news.mainImagePath!},
                        );
                      }
                    },
                    child: CachedNetworkImage(
                      imageUrl:
                          (news.previewPath != null) ? news.previewPath! : '',
                      fit: BoxFit.cover,
                      height: double.infinity,
                      placeholder: (_, __) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (_, __, ___) =>
                          NewsListTileParams.kIconError,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: imgWidth + 3),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                        height: NewsHeaderParams.kHorizPadding +
                            0.5 * NewsHeaderParams.kTopPadding),
                    Hero(
                      tag: heroNewsTitleTag(news.id),
                      child: Material(
                        color: Colors.transparent,
                        child: Text(
                          news.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                          0, 6, 0, NewsHeaderParams.kVertPadding),
                      child: Text(news.formattedDateTime()),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 14),
            ],
          ),
        ],
      ),
    );
  }
}
