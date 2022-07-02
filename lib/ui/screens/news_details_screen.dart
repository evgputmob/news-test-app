import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:news_test_app/=models=/news.dart';
import 'package:news_test_app/ui/widgets/news_details_screen/news_header.dart';
import 'package:news_test_app/ui/widgets/news_details_screen/news_images.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatelessWidget {
  static const name = 'newsdetails';
  static const path = '/newsdetails';

  final News? news;

  const NewsDetailsScreen({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double htmlBodyMarginTop = 14;
    if ((news != null) && (news!.additionalImagesPaths.isNotEmpty)) {
      htmlBodyMarginTop = 0;
    }

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Подробности'),
        ),
        body: (news != null)
            ? Column(
                children: [
                  NewsHeader(news: news!),
                  NewsImages(images: news!.additionalImagesPaths),
                  //const SizedBox(height: 14),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Html(
                        data: news!.text,
                        style: {
                          'body': Style(
                              margin: EdgeInsets.fromLTRB(
                                  16, htmlBodyMarginTop, 16, 16),
                              padding: const EdgeInsets.all(0),
                              fontSize: FontSize.em(1.1),
                              color: Colors.grey[850]),
                          'p': Style(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          ),
                          'a': Style(textDecoration: TextDecoration.none),
                        },
                        onLinkTap: (url, context, attributes, element) {
                          if (url != null) {
                            launchUrl(
                              Uri.parse(url),
                              mode: LaunchMode.externalApplication,
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              )
            : const Center(child: Text('Что-то пошло не так')));
  }
}
