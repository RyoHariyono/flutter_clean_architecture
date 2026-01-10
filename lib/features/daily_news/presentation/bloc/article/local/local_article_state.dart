import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/features/daily_news/domain/entities/article.dart';

abstract class LocalArticleState extends Equatable {
  final List<ArticleEntity>? articles;

  const LocalArticleState({this.articles});

  @override
  List<Object> get props => [articles!];
}

class LocalArticlesLoading extends LocalArticleState {
  const LocalArticlesLoading();
}

class LocalArticlesLoaded extends LocalArticleState {
  const LocalArticlesLoaded(List<ArticleEntity> articles)
      : super(articles: articles);
}
