import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_test_app/=models=/news.dart';
import 'package:news_test_app/data/i_news_service.dart';
import 'x_status.dart';

//------
// State

class NewsState extends Equatable {
  final XStatus status;
  final List<News> news;
  final String? errorMessage;

  const NewsState({
    this.status = XStatus.initial,
    this.news = const [],
    this.errorMessage,
  });

  @override
  List<Object?> get props => [status, news, errorMessage];
}

//------
// Cubit

class NewsCubit extends Cubit<NewsState> {
  final INewsService _newsService;

  NewsCubit({required INewsService newsService})
      : _newsService = newsService,
        super(const NewsState());

  Future<void> getNews() async {
    emit(const NewsState(status: XStatus.inProgress));
    try {
      final _newsList = await _newsService.fetchNews();
      emit(NewsState(status: XStatus.success, news: _newsList));
    } catch (e) {
      emit(NewsState(status: XStatus.failure, errorMessage: e.toString()));
    }
  }

  void toInitial() {
    emit(const NewsState(status: XStatus.initial));
  }
}
