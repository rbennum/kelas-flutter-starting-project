import 'package:flutter/material.dart';
import 'package:student_lecture_app/core/commons/constants.dart';
import 'package:student_lecture_app/presentation/pages/dummy_ui/widgets/row_card.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

class DummyUIGridViewPage extends StatelessWidget {
  const DummyUIGridViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
          crossAxisCount: 2,
          padding: UIHelper.padding(horizontal: 8, vertical: 10),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: List.generate(
              10,
              (index) =>
                  RowCard(index: index, imageSource: Constants.dummyImg))),
    );
  }
}
