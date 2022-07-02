import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:news_test_app/=models=/news.dart';
import 'package:news_test_app/ui/screens/image_preview_screen.dart';

class NewsHeader extends StatelessWidget {
  final News news;

  const NewsHeader({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const horizPadding = 11.0;
    const topPadding = 2.0;
    const vertPadding = horizPadding + topPadding;

    String newsDateTime;
    try {
      final dateTime = DateTime.parse(news.dateTime);
      newsDateTime = DateFormat('dd/MM/yyyy HH:mm').format(dateTime);
    } catch (e) {
      newsDateTime = news.dateTime;
    }

    if (news.previewPath == null) {
      return Container(
        color: Theme.of(context).primaryColor.withOpacity(0.2),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: horizPadding + 0.5 * topPadding),
            Hero(
              tag: 'title_${news.id}',
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
              padding: const EdgeInsets.fromLTRB(0, 6, 0, vertPadding),
              child: Text(newsDateTime),
            ),
          ],
        ),
      );
    }

    //---
    // Здесь есть картинка previewPath у новости

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
      constraints: BoxConstraints(minHeight: imgWidth + 1.5 * topPadding),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              alignment: Alignment.topLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: horizPadding,
                  vertical: vertPadding,
                ),
                width: imgWidth,
                child: Hero(
                  tag: 'image_${news.id}',
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
                      imageUrl: news.previewPath!,
                      fit: BoxFit.cover,
                      height: double.infinity,
                      placeholder: (_, __) =>
                          const Center(child: CircularProgressIndicator()),
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
                    const SizedBox(height: horizPadding + 0.5 * topPadding),
                    Hero(
                      tag: 'title_${news.id}',
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
                      padding: const EdgeInsets.fromLTRB(0, 6, 0, vertPadding),
                      child: Text(newsDateTime),
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
