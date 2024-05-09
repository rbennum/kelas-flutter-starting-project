import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_lecture_app/core/commons/colors_const.dart';
import 'package:student_lecture_app/presentation/pages/dummy_ui_2/widgets/dummy_ui_grid_view_page.dart';
import 'package:student_lecture_app/presentation/pages/dummy_ui_2/widgets/dummy_ui_list_view_page.dart';
import 'package:student_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';

@RoutePage()
class DummyUIListPage extends StatelessWidget {
  const DummyUIListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: const [
                  Tab(
                    text: "ListView",
                  ),
                  Tab(
                    text: "GridView",
                  ),
                ],
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: ColorConstant.primary,
                labelStyle: context.textTheme.displaySmall
                    ?.copyWith(color: ColorConstant.primary),
                unselectedLabelColor: ColorConstant.grey,
                indicatorWeight: 5.0,
              ),
              title: const Text('Dummy UI'),
            ),
            body: const TabBarView(
              children: [
                DummyUIListViewPage(),
                DummyUIGridViewPage(),
              ],
            )),
      ),
    );
  }
}
