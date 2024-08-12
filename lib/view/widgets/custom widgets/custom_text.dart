import 'package:flutter/material.dart';
import 'package:student/utils/shared/theme.dart';
import 'package:student/utils/constants.dart';

class CustomText extends StatelessWidget {
  CustomText(
      {super.key, required this.text, this.color, this.size, this.textStyle});
  String text;
  TextStyle? textStyle = headingStyle3;
  Color? color = AppColors.primaryClr;
  double? size = 18;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle != null
          ? textStyle!.copyWith(fontSize: size, color: color)
          : headingStyle4.copyWith(fontSize: size, color: color),
      textAlign: TextAlign.start,
    );
  }
}
