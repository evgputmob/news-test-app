import 'package:news_test_app/=models=/news.dart';

abstract class INewsService {
  Future<List<News>> fetchNews();
}
