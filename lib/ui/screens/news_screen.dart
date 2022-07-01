import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_test_app/ui/screens/news_details_screen.dart';
import 'package:news_test_app/ui/widgets/news_list.dart';

class NewsScreen extends StatelessWidget {
  static const name = 'news';
  static const path = '/news';

  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Новости'),
        ),
        body: const NewsList());
  }
}
