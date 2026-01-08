import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/core/constants/constants.dart';
import 'package:flutter_clean_architecture/features/daily_news/data/models/article.dart';
import 'package:retrofit/http.dart';
part 'news_api_service.g.dart';

@RestApi(baseUrl: newsApiBaseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<Map<String, dynamic>> getNewsArticles({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}
