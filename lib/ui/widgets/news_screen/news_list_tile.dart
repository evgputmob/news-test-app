import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_test_app/=models=/news.dart';
import 'package:news_test_app/ui/constants.dart';
import 'package:news_test_app/ui/screens/news_details_screen.dart';
import 'package:news_test_app/ui/utils.dart';

class NewsListTile extends StatelessWidget {
  final News news;

  const NewsListTile({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imgUrl = news.previewPath ?? '';

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 6, 4, 6),
      child: ListTile(
        onTap: () {
          context.pushNamed(NewsDetailsScreen.name, extra: news);
        },
        leading: imgUrl.isEmpty
            ? NewsListTileParams.kIconNewspaper
            : Hero(
                tag: heroNewsImageTag(news.id),
                child: CachedNetworkImage(
                  imageUrl: imgUrl,
                  width: NewsListTileParams.kPreviewImgSideSize,
                  height: NewsListTileParams.kPreviewImgSideSize,
                  placeholder: (_, __) => NewsListTileParams.kIconNewspaper,
                  errorWidget: (_, __, ___) => NewsListTileParams.kIconError,
                ),
              ),
        title: Hero(
          tag: heroNewsTitleTag(news.id),
          child: Material(
            child: Text(
              news.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        subtitle: Text(
          stripHtmlTags(news.text).trim(),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
