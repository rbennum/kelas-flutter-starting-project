// main entry point for news feature
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App"),
      ),
      body: Padding(
        padding: UIHelper.padding(horizontal: 20),
        child: CustomScrollView(
          controller: ScrollController(),
          // slivers: const <Widget>[
          //   _ToDoInputView(),
          //   _ToDoHistoryView(),
          //   _ToDoHistoryListView(),
          // ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: MediaQuery.of(context).viewInsets,
        margin: UIHelper.padding(horizontal: 10, vertical: 20),
        child: ElevatedButton(
          onPressed: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: const Text("Save"),
        ),
      ),
    );
  }
}
