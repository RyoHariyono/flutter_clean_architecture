import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:flutter_clean_architecture/features/daily_news/presentation/pages/article_detail/article_details.dart';
import 'package:flutter_clean_architecture/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:flutter_clean_architecture/features/daily_news/presentation/pages/saved_articles/saved_articles.dart';

class AppRoutes {
  static const String home = '/';
  static const String articleDetail = '/article_detail';
  static const String savedArticles = '/saved_articles';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const DailyNews());

      case articleDetail:
        final article = settings.arguments as ArticleEntity;
        return MaterialPageRoute(
          builder: (_) => ArticleDetailsView(article: article),
        );

      case savedArticles:
        return MaterialPageRoute(builder: (_) => const SavedArticles());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
