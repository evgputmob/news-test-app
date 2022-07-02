import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_test_app/logic/news_cubit.dart';
import 'package:news_test_app/ui/widgets/news_screen/news_list.dart';

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
          actions: [
            IconButton(
              onPressed: context.read<NewsCubit>().getNews,
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: const NewsList());
  }
}
