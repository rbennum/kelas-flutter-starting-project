// main entry point for news feature
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_lecture_app/application/news/news_most_popular_cubit.dart';
import 'package:student_lecture_app/core/commons/colors_const.dart';
import 'package:student_lecture_app/core/injection/injection.dart';
import 'package:student_lecture_app/core/routes/app_router.gr.dart';
import 'package:student_lecture_app/presentation/pages/news/widgets/headline_news.dart';
import 'package:student_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/news_card.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NewsMostPopularCubit>()..getMostPopular(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("News App"),
            ),
            body: Padding(
              padding: UIHelper.padding(horizontal: 20),
              child: CustomScrollView(
                controller: ScrollController(),
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HeadlineNews(
                          title: "Top Stories",
                          subtitle: "Top stories from all time",
                        ),
                        UIHelper.verticalSpace(10),
                        InkWell(
                          onTap: () {}, // TODO: take care of this action
                          child: Container(
                            padding: UIHelper.padding(all: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: ColorConstant.primary),
                              borderRadius:
                                  UIHelper.borderRadiusCircular(all: 8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Go to Categories Section",
                                  style: context.textTheme.labelSmall?.copyWith(
                                    color: ColorConstant.primary,
                                  ),
                                ),
                                Icon(
                                  Icons.double_arrow_rounded,
                                  size: UIHelper.setSp(20),
                                  color: ColorConstant.primary,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SliverPadding(
                    padding: UIHelper.padding(top: 10),
                    sliver: SliverToBoxAdapter(
                      child: HeadlineNews(
                        title: "Most Popular Articles",
                        subtitle: "Top articles from last week",
                        onTap: () => AutoRouter.of(context).push(
                          const NewsPopularRoute(),
                        ),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: UIHelper.padding(top: 10),
                    sliver:
                        BlocBuilder<NewsMostPopularCubit, NewsMostPopularState>(
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
                                return NewsCard(
                                  title: article.title,
                                  imgSrc: article.multimediaConverted,
                                  desc:
                                      '${article.byline} \u2022 ${article.publishedDateConverted}',
                                );
                              },
                              itemCount: 3,
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
        },
      ),
    );
  }
}
