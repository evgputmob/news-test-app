import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_test_app/logic/news_cubit.dart';
import 'package:news_test_app/logic/x_status.dart';
import 'news_list_tile.dart';

class NewsList extends StatelessWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsState = context.watch<NewsCubit>().state;

    switch (newsState.status) {
      case XStatus.initial:
        return const SizedBox.shrink();
      //---
      case XStatus.inProgress:
        return const Center(child: CircularProgressIndicator());
      //---
      case XStatus.failure:
        return Center(
          child: (newsState.errorMessage != null)
              ? Text(newsState.errorMessage!, textAlign: TextAlign.center)
              : const Text('Something went wrong', textAlign: TextAlign.center),
        );
      //---
      case XStatus.success:
    }

    final news = newsState.news;

    if (news.isEmpty) {
      return const Center(
        child: Text('Нет новостей', style: TextStyle(fontSize: 18)),
      );
    }

    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (context, index) => NewsListTile(news: news[index]),
      //keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
    );
  }
}
