import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';
import 'package:news_test_app/=models=/news.dart';
import 'package:news_test_app/data/i_news_service.dart';
import 'package:news_test_app/data/implementations/news_service.dart';
import 'package:news_test_app/logic/news_cubit.dart';
import 'package:news_test_app/ui/screens/full_screen_carousel.dart';
import 'package:news_test_app/ui/screens/image_preview_screen.dart';
import 'package:news_test_app/ui/screens/news_details_screen.dart';
import 'package:news_test_app/ui/screens/news_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  GetIt.I.registerSingleton<INewsService>(NewsService());

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              NewsCubit(newsService: GetIt.I<INewsService>())..getNews(),
        ),
      ],
      child: NewsAppTestApp(),
    ),
  );
}

//---
class NewsAppTestApp extends StatelessWidget {
  NewsAppTestApp({
    Key? key,
  }) : super(key: key);

  final _router = GoRouter(
    initialLocation: NewsScreen.path,
    routes: [
      GoRoute(
        name: NewsScreen.name,
        path: NewsScreen.path,
        builder: (_, __) => const NewsScreen(),
      ),
      GoRoute(
        name: NewsDetailsScreen.name,
        path: NewsDetailsScreen.path,
        builder: (_, state) => NewsDetailsScreen(
          news: (state.extra != null) ? (state.extra! as News) : null,
        ),
      ),
      GoRoute(
        name: ImagePreviewScreen.name,
        path: ImagePreviewScreen.path,
        builder: (_, state) => ImagePreviewScreen(
          imagePath: (state.params['imagePath'] != null)
              ? state.params['imagePath']!
              : '',
        ),
      ),
      GoRoute(
        name: FullScreenCarousel.name,
        path: FullScreenCarousel.path,
        builder: (_, state) => FullScreenCarousel(
          images: (state.extra != null) ? state.extra! as List<String> : [],
          startIndex: int.tryParse(
                (state.params['startIndex'] != null)
                    ? state.params['startIndex']!
                    : '',
              ) ??
              0,
        ),
      ),
    ],
    //debugLogDiagnostics: true,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: 'News App Test',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
    );
  }
}
