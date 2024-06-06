// a private class to show list of news based on the selected section
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_lecture_app/application/news/news_top_stories_cubit.dart';
import 'package:student_lecture_app/core/commons/colors_const.dart';
import 'package:student_lecture_app/core/injection/injection.dart';
import 'package:student_lecture_app/core/routes/app_router.gr.dart';
import 'package:student_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/news_card.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class NewsTopStoryPage extends StatelessWidget {
  final String section;

  const NewsTopStoryPage({
    super.key,
    required this.section,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NewsTopStoriesCubit>()..getTopStories(section),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Top Stories"),
        ),
        body: Padding(
          padding: UIHelper.padding(horizontal: 20),
          child: CustomScrollView(
            controller: ScrollController(),
            slivers: [
              SliverPadding(
                padding: UIHelper.padding(bottom: 10),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "SECTION:",
                        style: context.textTheme.headlineSmall?.copyWith(
                          color: ColorConstant.grey,
                        ),
                      ),
                      Text(
                        section.toUpperCase(),
                        style: context.textTheme.headlineSmall?.copyWith(
                          color: ColorConstant.primary,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              BlocBuilder<NewsTopStoriesCubit, NewsTopStoriesState>(
                builder: (context, state) {
                  return state.responseOption.fold(
                    () => state.isLoading
                        ? SliverFillRemaining(
                            child: UIHelper.loading(),
                          )
                        : const SliverToBoxAdapter(
                            child: SizedBox.shrink(),
                          ),
                    (result) => result.fold(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
