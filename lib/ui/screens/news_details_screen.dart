import 'package:flutter/material.dart';

class NewsDetailsScreen extends StatelessWidget {
  static const name = 'newsdetails';
  static const path = '/newsdetails';

  const NewsDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Подробности'),
        ),
        body: const SizedBox(height: 30));
  }
}
