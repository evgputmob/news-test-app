import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_test_app/logic/news_cubit.dart';

class ErrorMessage extends StatelessWidget {
  final String? messageText;

  const ErrorMessage({Key? key, required this.messageText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: double.infinity),
        const Text(
          'Ошибка',
          style: TextStyle(
            fontSize: 18,
            color: Colors.red,
          ),
        ),
        const SizedBox(height: 20),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 200),
          child: SizedBox(
            width: 300,
            child: Text(
              messageText ?? 'Что-то пошло не так',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[800],
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          child: const Text(
            'Попробовать снова',
            style: TextStyle(fontSize: 17),
          ),
          onPressed: () {
            context.read<NewsCubit>().getNews();
          },
        ),
      ],
    );
  }
}
