// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_app/core/constants/constants.dart';
import 'package:flutter_app/core/resources/data_state.dart';
import 'package:flutter_app/features/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:flutter_app/features/daily_news/data/models/article.dart';
import 'package:flutter_app/features/daily_news/domain/repository/article_repository.dart';

class ArticleRespositoryImpl implements ArticleRespository {
  final NewsApiService _newsApiService;

  ArticleRespositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
          apiKey: newsAPIKey, category: categoryQuery, country: countryQuery);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioError(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioErrorType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
