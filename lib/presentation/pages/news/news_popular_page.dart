// a private class to show list of most popular articles
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_lecture_app/application/news/news_most_popular_cubit.dart';
import 'package:student_lecture_app/core/injection/injection.dart';
import 'package:student_lecture_app/core/routes/app_router.gr.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/news_card.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class NewsPopularPage extends StatelessWidget {
  const NewsPopularPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NewsMostPopularCubit>()..getMostPopular(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Most Popular Articles"),
        ),
        body: CustomScrollView(
          controller: ScrollController(),
          slivers: <Widget>[
            SliverPadding(
              padding: UIHelper.padding(top: 10),
              sliver: BlocBuilder<NewsMostPopularCubit, NewsMostPopularState>(
                builder: (context, state) {
                  return state.responseOption.fold(
                    () => state.isLoading
                        ? SliverFillRemaining(
                            child: UIHelper.loading(),
                          )
                        : const SliverToBoxAdapter(
                            child: SizedBox.shrink(),
                          ),
                    (response) => response.fold(
                      (failure) => failure.when(
                        fromServerSide: (val) => SliverFillRemaining(
                          child: Text(val),
                        ),
                      ),
                      (response) => SliverList.builder(
                        itemBuilder: (context, index) {
                          final article = response[index];
                          return InkWell(
                            child: NewsCard(
                              title: article.title,
                              imgSrc: article.multimediaConverted,
                              desc:
                                  '${article.byline} \u2022 ${article.publishedDateConverted}',
                            ),
                            onTap: () => AutoRouter.of(context).push(
                              NewsDetailRoute(
                                urlString: article.url,
                                title: article.title,
                              ),
                            ),
                          );
                        },
                        itemCount: response.length,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
