import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_test_app/logic/news_cubit.dart';
import 'package:news_test_app/logic/x_status.dart';
import 'package:news_test_app/ui/widgets/news_screen/error_message.dart';
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
        return ErrorMessage(messageText: newsState.errorMessage);
      //---
      case XStatus.success:
    }

    final news = newsState.news;

    if (news.isEmpty) {
      return const Center(
        child: Text('Нет новостей', style: TextStyle(fontSize: 18)),
      );
    }

    return RefreshIndicator(
      onRefresh: context.read<NewsCubit>().getNews,
      child: ListView.separated(
        itemCount: news.length,
        itemBuilder: (_, index) => NewsListTile(news: news[index]),
        separatorBuilder: (_, __) =>
            Container(color: Colors.grey[350], height: 2),
        //keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      ),
    );
  }
}
