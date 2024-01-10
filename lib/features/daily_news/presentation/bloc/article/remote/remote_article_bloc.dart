import 'package:flutter_app/core/resources/data_state.dart';
import 'package:flutter_app/features/daily_news/domain/usecase/get_article_usecase.dart';
import 'package:flutter_app/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:flutter_app/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import "package:flutter_bloc/flutter_bloc.dart";

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;
  RemoteArticleBloc(this._getArticleUseCase)
      : super(const RemoteArticleLoading()) {
    on<GetArticle>(onGetArticles);
  }

  void onGetArticles(GetArticle event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticleDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RemoteArticleError(dataState.error!));
    }
  }
}
