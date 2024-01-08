import 'package:flutter_app/core/resources/data_state.dart';
import 'package:flutter_app/features/daily_news/data/models/article.dart';
import 'package:flutter_app/features/daily_news/domain/entities/article.dart';
import 'package:flutter_app/features/daily_news/domain/repository/article_repository.dart';

class ArticleRespositoryImpl implements ArticleRespository {
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() {
    // TODO: implement getNewsArticles
    throw UnimplementedError();
  }
}
