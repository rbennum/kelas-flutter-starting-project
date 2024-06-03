import 'package:fpdart/fpdart.dart';
import 'package:student_lecture_app/domain/core/app_failure.dart';
import 'package:student_lecture_app/domain/news/news_data_source.dart';
import 'package:student_lecture_app/infrastructure/common/dtos/article_model.dart';

abstract class INewsRepository {
  Future<Either<AppFailure, List<ArticleModel>>> getTopStories(String section);
  Future<Either<AppFailure, List<ArticleModel>>> getMostPopular();
}

class NewsRepository implements INewsRepository {
  final NewsDataSource _dataSource;

  NewsRepository(this._dataSource);

  @override
  Future<Either<AppFailure, List<ArticleModel>>> getMostPopular() async {
    try {
      final response = await _dataSource.getMostPopular();
      return right(response);
    } catch (e) {
      return left(AppFailure.fromServerSide(e.toString()));
    }
  }

  @override
  Future<Either<AppFailure, List<ArticleModel>>> getTopStories(
      String section) async {
    try {
      final response = await _dataSource.getTopStories(section);
      return right(response);
    } catch (e) {
      return left(AppFailure.fromServerSide(e.toString()));
    }
  }
}
