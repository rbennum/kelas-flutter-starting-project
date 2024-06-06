part of 'news_most_popular_cubit.dart';

@freezed
class NewsMostPopularState with _$NewsMostPopularState {
  const NewsMostPopularState._();

  const factory NewsMostPopularState({
    required Option<Either<AppFailure, List<ArticleModel>>> responseOption,
    required bool isLoading,
  }) = _NewsMostPopularState;

  factory NewsMostPopularState.initial() =>
      NewsMostPopularState(responseOption: none(), isLoading: false);

  NewsMostPopularState get unmodified =>
      copyWith(isLoading: false, responseOption: none());
}
