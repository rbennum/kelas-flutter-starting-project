import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:student_lecture_app/domain/core/app_failure.dart';
import 'package:student_lecture_app/domain/news/news_repository.dart';
import 'package:student_lecture_app/infrastructure/common/dtos/article_model.dart';

part 'news_most_popular_cubit.freezed.dart';
part 'news_most_popular_state.dart';

@injectable
class NewsMostPopularCubit extends Cubit<NewsMostPopularState> {
  final INewsRepository _repository;

  NewsMostPopularCubit(this._repository)
      : super(NewsMostPopularState.initial());

  void getMostPopular() async {
    emit(state.unmodified.copyWith(isLoading: true));
    Either<AppFailure, List<ArticleModel>> response =
        await _repository.getMostPopular();
    emit(state.unmodified.copyWith(responseOption: optionOf(response)));
  }
}
