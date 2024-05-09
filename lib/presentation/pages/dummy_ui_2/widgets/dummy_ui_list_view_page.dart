import 'package:flutter/material.dart';
import 'package:student_lecture_app/core/commons/constants.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/news_card.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

class DummyUIListViewPage extends StatelessWidget {
  const DummyUIListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: UIHelper.padding(horizontal: 8, vertical: 10),
        children: List.generate(
            5,
            (index) => NewsCard(
                imgSrc: Constants.dummyImg,
                title: "How can I be Flutter Developer Expert?",
                desc: "Jill Lepore \u2022 23 May 23")),
      ),
    );
  }
}
