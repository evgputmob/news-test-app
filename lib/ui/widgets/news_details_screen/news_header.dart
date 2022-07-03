import 'package:flutter/material.dart';
import 'package:news_test_app/=models=/news.dart';
import 'package:news_test_app/ui/constants.dart';
import 'package:news_test_app/ui/utils.dart';
import 'package:news_test_app/ui/widgets/news_details_screen/news_header_with_image.dart';

class NewsHeader extends StatelessWidget {
  final News news;

  const NewsHeader({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (news.previewPath == null)
        // У новости нет основной картинки
        ? Container(
            color: Theme.of(context).primaryColor.withOpacity(0.2),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
          )
        // У новости есть основная картинка
        : NewsHeaderWithImage(news: news);
  }
}
