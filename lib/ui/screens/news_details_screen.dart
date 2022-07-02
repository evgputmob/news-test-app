import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:news_test_app/=models=/news.dart';
import 'package:news_test_app/ui/widgets/news_details_screen/news_header.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatelessWidget {
  static const name = 'newsdetails';
  static const path = '/newsdetails';

  final News? news;

  const NewsDetailsScreen({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Подробности'),
      ),
      body: (news == null)
          ? const Center(child: Text('Что-то пошло не так'))
          : Column(
              children: [
                NewsHeader(news: news!),
                Expanded(
                  child: SingleChildScrollView(
                    child: Html(
                      data: news!.text,
                      style: {
                        'body': Style(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            padding: const EdgeInsets.all(0),
                            fontSize: FontSize.em(1.1),
                            color: Colors.grey[850]),
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
            ),
    );
  }
}
