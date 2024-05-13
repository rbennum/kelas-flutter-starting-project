import 'package:flutter/material.dart';
import 'package:student_lecture_app/core/commons/colors_const.dart';
import 'package:student_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';

class SplashItemCard extends StatelessWidget {
  final String title;
  final String description;

  const SplashItemCard(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.textTheme.headlineLarge?.copyWith(
                  color: ColorConstant.primary,
                ),
              ),
              Text(
                description,
                style: context.textTheme.bodySmall?.copyWith(
                  color: ColorConstant.grey,
                ),
              )
            ],
          ),
        ),
        const Spacer(),
        const Icon(Icons.arrow_forward_ios_outlined, size: 24,)
      ],
    );
  }
}
