part of 'news_top_stories_cubit.dart';

@freezed
class NewsTopStoriesState with _$NewsTopStoriesState {
  const NewsTopStoriesState._();

  const factory NewsTopStoriesState({
    required Option<Either<AppFailure, List<ArticleModel>>> responseOption,
    required bool isLoading,
  }) = _NewsTopStoriesState;

  factory NewsTopStoriesState.initial() => NewsTopStoriesState(
        responseOption: none(),
        isLoading: false,
      );

  NewsTopStoriesState get unmodified =>
      copyWith(isLoading: false, responseOption: none());
}
