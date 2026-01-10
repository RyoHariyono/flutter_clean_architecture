import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/resources/data_state.dart';
import 'package:flutter_clean_architecture/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:flutter_clean_architecture/features/daily_news/domain/usecases/remove_article.dart';
import 'package:flutter_clean_architecture/features/daily_news/domain/usecases/save_article.dart';
import 'package:flutter_clean_architecture/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:flutter_clean_architecture/features/daily_news/presentation/bloc/article/local/local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;

  LocalArticleBloc(
    this._getSavedArticleUseCase,
    this._saveArticleUseCase,
    this._removeArticleUseCase,
  ) : super(const LocalArticlesLoading()) {
    on<GetSavedArticles>(onGetSavedArticles);
    on<RemoveArticle>(onRemoveArticle);
    on<SaveArticle>(onSaveArticle);
  }

  Future<void> onGetSavedArticles(
      GetSavedArticles event, Emitter<LocalArticleState> emit) async {
    final dataState = await _getSavedArticleUseCase();
    if (dataState is DataSuccess) {
      emit(LocalArticlesLoaded(dataState.data!));
    }
  }

  Future<void> onRemoveArticle(
      RemoveArticle event, Emitter<LocalArticleState> emit) async {
    await _removeArticleUseCase(params: event.article);
    final dataState = await _getSavedArticleUseCase();
    if (dataState is DataSuccess) {
      emit(LocalArticlesLoaded(dataState.data!));
    }
  }

  Future<void> onSaveArticle(
      SaveArticle event, Emitter<LocalArticleState> emit) async {
    await _saveArticleUseCase(params: event.article);
    final dataState = await _getSavedArticleUseCase();
    if (dataState is DataSuccess) {
      emit(LocalArticlesLoaded(dataState.data!));
    }
  }
}
