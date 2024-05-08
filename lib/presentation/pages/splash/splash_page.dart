import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_lecture_app/core/routes/app_router.gr.dart';
import 'package:student_lecture_app/presentation/pages/splash/widgets/splash_item_card.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final List<String> entries = <String>['Entry A', 'Entry B'];
    final List<SplashItem> entries = <SplashItem>[
      SplashItem(
          "Dummy UI",
          "Practice Flutter UI and get familiar with UI Widgets",
          () => AutoRouter.of(context).push(const DummyUIRoute())),
    ];

    return Scaffold(
        appBar: AppBar(
          title: const Text("Choose Section"),
        ),
        body: ListView.separated(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () => entries[index].action(),
              child: SplashItemCard(
                  title: entries[index].title,
                  description: entries[index].description),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ));
  }
}

class SplashItem {
  final String title;
  final String description;
  final Function action;

  SplashItem(this.title, this.description, this.action);
}
