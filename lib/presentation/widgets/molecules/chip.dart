import 'package:flutter/material.dart';
import 'package:student_lecture_app/core/commons/colors_const.dart';
import 'package:student_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

class ChipCustom extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final bool isSelected;
  const ChipCustom({
    super.key,
    required this.onTap,
    required this.title,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: UIHelper.padding(vertical: 5, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? ColorConstant.lightBlue : null,
          border: isSelected
              ? Border.all(
                  color: ColorConstant.lightBlue,
                  width: 2,
                )
              : Border.all(
                  color: ColorConstant.lightGrey,
                  width: 1,
                ),
          borderRadius: UIHelper.borderRadiusCircular(all: 5),
        ),
        child: Text(
          title,
          style: context.textTheme.bodyMedium?.copyWith(
            color: isSelected ? ColorConstant.primary : null,
          ),
        ),
      ),
    );
  }
}
