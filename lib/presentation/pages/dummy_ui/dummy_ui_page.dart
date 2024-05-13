import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_lecture_app/core/commons/colors_const.dart';
import 'package:student_lecture_app/core/commons/constants.dart';
import 'package:student_lecture_app/core/routes/app_router.gr.dart';
import 'package:student_lecture_app/presentation/pages/dummy_ui/widgets/row_card.dart';
import 'package:student_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/news_card.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/text_form_field.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class DummyUIPage extends StatelessWidget {
  const DummyUIPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Dummy UI"),
        ),
        body: SingleChildScrollView(
          padding: UIHelper.padding(vertical: 10, horizontal: 20),
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            InkWell(
              onTap: () =>
                  AutoRouter.of(context).push(const DummyUIListRoute()),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Next",
                          style: context.textTheme.headlineLarge
                              ?.copyWith(color: ColorConstant.primary)),
                      Text(
                        "Tab Bar, Grid View, List View",
                        style: context.textTheme.bodyMedium
                            ?.copyWith(color: ColorConstant.grey),
                      )
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
            UIHelper.verticalSpace(20),
            Text(
              "CONTAINER AND TEXT",
              style: context.textTheme.headlineMedium
                  ?.copyWith(color: ColorConstant.green),
            ),
            UIHelper.verticalSpace(10),
            NewsCard(
                imgSrc: Constants.dummyImg,
                title: "How can I be Flutter Developer Expert?",
                desc: "Jill Lepore \u2022 23 May 23"),
            UIHelper.verticalSpace(20),
            Text(
              "COLUMN",
              style: context.textTheme.headlineMedium
                  ?.copyWith(color: ColorConstant.green),
            ),
            UIHelper.verticalSpace(10),
            ...List.generate(
                2,
                    (index) => NewsCard(
                    imgSrc: Constants.dummyImg,
                    title: "How can I be Flutter Developer Expert?",
                    desc: "Jill Lepore \u2022 23 May 23")),
            UIHelper.verticalSpace(20),
            Text(
              "ROW",
              style: context.textTheme.headlineMedium
                  ?.copyWith(color: ColorConstant.green),
            ),
            UIHelper.verticalSpace(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  3,
                      (index) =>
                      RowCard(index: index, imageSource: Constants.dummyImg)),
            ),
            UIHelper.verticalSpace(20),
            Text(
              "BUTTON",
              style: context.textTheme.headlineMedium
                  ?.copyWith(color: ColorConstant.green),
            ),
            UIHelper.verticalSpace(10),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text('Press Me'))),
            UIHelper.verticalSpace(20),
            Text(
              "INPUT",
              style: context.textTheme.headlineMedium
                  ?.copyWith(color: ColorConstant.green),
            ),
            UIHelper.verticalSpace(10),
            const TextFormFieldCustom(
              title: "Email",
              prefixIcon: Icon(Icons.email_outlined),
              hintText: "Enter your email",
            ),
            UIHelper.verticalSpace(20),
            Text(
              "IMAGE ASSET, SIZED BOX & EXPANDED",
              style: context.textTheme.headlineMedium
                  ?.copyWith(color: ColorConstant.green),
            ),
            UIHelper.verticalSpace(10),
            Row(
              children: [
                Expanded(
                    flex: 2,
                    child: RowCard(index: 0, imageSource: Constants.dummyImg)),
                UIHelper.horizontalSpace(10),
                RowCard(index: 0, imageSource: Constants.dummyImg)
              ],
            ),
            UIHelper.verticalSpace(30)
          ]),
        ));
  }
}
