import 'package:injectable/injectable.dart';
import 'package:student_lecture_app/core/commons/api_path_constant.dart';
import 'package:student_lecture_app/infrastructure/common/dtos/article_model.dart';
import 'package:student_lecture_app/infrastructure/core/api_helper.dart';

@injectable
class NewsDataSource {
  final ApiHelper _apiHelper;

  NewsDataSource(this._apiHelper);

  Future<List<ArticleModel>> getTopStories(String section) async {
    final response = await _apiHelper.get(
      path: ApiPathConstant.topStories(section),
    );
    final rawList = response.data as List;
    final list = List.generate(
      rawList.length.clamp(0, 20),
      (index) => ArticleModel.fromJson(rawList[index]),
    );
    return list;
  }

  Future<List<ArticleModel>> getMostPopular() async {
    final response = await _apiHelper.get(path: ApiPathConstant.mostPopular);
    final rawList = response.data as List;
    final list = List.generate(
      rawList.length.clamp(0, 20),
      (index) => ArticleModel.fromMostPopular(rawList[index]),
    );
    return list;
  }
}
