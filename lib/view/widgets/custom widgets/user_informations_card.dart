import 'package:flutter/material.dart';
import 'package:student/utils/constants.dart';
import 'package:student/utils/shared/theme.dart';
import 'package:student/utils/size_config.dart';
import 'package:student/view/widgets/custom%20widgets/custom_text.dart';

class UserInformationsPageSection extends StatelessWidget {
  const UserInformationsPageSection(
      {super.key, required this.title, required this.content});

  final String title;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: UI.height * .115,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(width: 1, color: AppColors.border)),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: '◄ $title',
                textStyle: headingStyle5,
                color: Colors.black,
                size: 16,
              ),
              const SizedBox(height: 10),
              CustomText(
                text: content,
                textStyle: headingStyle4,
                size: 17,
                color: AppColors.primaryClr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
