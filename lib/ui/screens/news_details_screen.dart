import 'package:flutter/material.dart';
import 'package:news_test_app/=models=/news.dart';

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
          : Text(news!.text),
    );
  }
}
