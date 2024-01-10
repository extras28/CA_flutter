import 'package:dio/dio.dart';
import 'package:flutter_app/features/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:flutter_app/features/daily_news/data/repository/article_respository_impl.dart';
import 'package:flutter_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:flutter_app/features/daily_news/domain/usecase/get_article_usecase.dart';
import 'package:flutter_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder("app_database.db").build();

  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRespository>(ArticleRespositoryImpl(sl()));

  // UseCases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  // Bloc
  sl.registerSingleton<RemoteArticleBloc>(RemoteArticleBloc(sl()));
}
