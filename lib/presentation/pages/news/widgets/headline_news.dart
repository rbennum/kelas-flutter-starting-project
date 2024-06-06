import 'package:flutter/material.dart';
import 'package:student_lecture_app/core/commons/colors_const.dart';
import 'package:student_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

class HeadlineNews extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function? onTap;
  final String clickTitle;
  const HeadlineNews({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.clickTitle = "See All",
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: context.textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            UIHelper.verticalSpace(5),
            Text(
              subtitle,
              style: context.textTheme.titleMedium?.copyWith(
                color: ColorConstant.grey,
              ),
            )
          ],
        ),
        const Spacer(),
        if (onTap != null)
          InkWell(
            onTap: () => onTap!(),
            child: Text(
              clickTitle,
              style: context.textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: ColorConstant.primary,
              ),
            ),
          )
      ],
    );
  }
}
