import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/core/constants/constants.dart';
import 'package:flutter_clean_architecture/core/resources/data_state.dart';
import 'package:flutter_clean_architecture/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:flutter_clean_architecture/features/daily_news/data/models/article.dart';
import 'package:flutter_clean_architecture/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    final httpResponse = await _newsApiService.getNewsArticles(
      apiKey: newsAPIKey,
      country: countryQuery,
      category: categoryQuery,
    );
    if (httpResponse['response'].statusCode == HttpStatus.ok) {
      return DataSuccess(httpResponse['data']['articles']
          .map<ArticleModel>(
              (articleJson) => ArticleModel.fromJson(articleJson))
          .toList());
    } else {
      return DataFailed(
        DioError(
          error: httpResponse['response'].statusMessage,
          response: httpResponse['response'],
          type: DioErrorType.response,
          requestOptions: httpResponse['response'].requestOptions,
        ),
      );
    }
  }
}
