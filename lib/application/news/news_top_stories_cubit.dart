import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:student_lecture_app/domain/core/app_failure.dart';
import 'package:student_lecture_app/domain/news/news_repository.dart';
import 'package:student_lecture_app/infrastructure/common/dtos/article_model.dart';

part 'news_top_stories_cubit.freezed.dart';
part 'news_top_stories_state.dart';

@injectable
class NewsTopStoriesCubit extends Cubit<NewsTopStoriesState> {
  final INewsRepository _repository;

  NewsTopStoriesCubit(this._repository) : super(NewsTopStoriesState.initial());

  void getTopStories(String section) async {
    emit(state.unmodified.copyWith(isLoading: true));
    Either<AppFailure, List<ArticleModel>> response =
        await _repository.getTopStories(section);
    emit(state.unmodified.copyWith(responseOption: optionOf(response)));
  }
}
