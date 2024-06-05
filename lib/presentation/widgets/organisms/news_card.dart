import 'package:flutter/material.dart';
import 'package:student_lecture_app/core/commons/colors_const.dart';
import 'package:student_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

class NewsCard extends StatelessWidget {
  final String imgSrc;
  final String title;
  final String desc;
  const NewsCard({
    super.key,
    required this.imgSrc,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIHelper.padding(all: 10),
      margin: UIHelper.padding(bottom: 8),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorConstant.grey,
          width: 0.5,
        ),
        borderRadius: UIHelper.borderRadiusCircular(all: 10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: UIHelper.borderRadiusCircular(all: 10),
                  child: Image.network(
                    imgSrc,
                    width: UIHelper.setSp(70),
                    height: UIHelper.setSp(70),
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, trace) => SizedBox(
                      height: UIHelper.setHeight(70),
                      width: UIHelper.setWidth(70),
                      child: const Placeholder(),
                    ),
                  ),
                ),
                UIHelper.horizontalSpace(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: context.textTheme.headlineMedium,
                      ),
                      UIHelper.verticalSpace(10),
                      Text(
                        desc,
                        style: context.textTheme.bodySmall?.copyWith(
                          color: ColorConstant.darkGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          UIHelper.horizontalSpace(20),
        ],
      ),
    );
  }
}
