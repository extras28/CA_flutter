import 'package:flutter_app/core/resources/data_state.dart';
import 'package:flutter_app/features/daily_news/domain/entities/article.dart';
import 'package:flutter_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:flutter_app/features/daily_news/domain/usecase/usecase.dart';

class GetArticleUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRespository _articleRespository;

  GetArticleUseCase(this._articleRespository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRespository.getNewsArticles();
  }
}
