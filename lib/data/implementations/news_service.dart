import 'package:dio/dio.dart';
import 'package:news_test_app/=models=/news.dart';
import 'package:news_test_app/data/i_news_service.dart';
import 'constants.dart';

class NewsService implements INewsService {
  late final Dio _dio;

  NewsService() {
    _dio = Dio(kDioOptions);
  }

  @override
  Future<List<News>> fetchNews() async {
    try {
      final response =
          await _dio.get('/News?schoolType=ballet&cityId=1&count=10');
      final newsJsonArr = response.data as List<dynamic>;
      final news = newsJsonArr.map((item) => News.fromJson(item)).toList();
      return news;
    } on DioError catch (e) {
      return Future.error(e.message);
    } catch (e) {
      return Future.error('Network error');
    }
  }
}
