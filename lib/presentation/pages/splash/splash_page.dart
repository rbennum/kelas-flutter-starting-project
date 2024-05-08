import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_lecture_app/core/routes/app_router.gr.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final List<String> entries = <String>['Entry A', 'Entry B'];
    final List<SplashItem> entries = <SplashItem>[
      SplashItem("Entry A", "Description of Entry A",
          () => AutoRouter.of(context).push(const DummyUIRoute())),
    ];

    return Scaffold(
        appBar: AppBar(
          title: const Text("Choose Section"),
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () => entries[index].action(),
              child: SizedBox(
                height: 50,
                child: Center(
                  child: Text(entries[index].title),
                ),
              ),
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
