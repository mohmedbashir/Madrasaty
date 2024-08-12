import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/utils/constants.dart';
import 'package:student/utils/shared/theme.dart';

import '../../../../widgets/custom widgets/custom_widgets.dart';

class CommentsPage extends StatelessWidget {
  const CommentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: CustomText(
            text: 'الملاحظات',
            textStyle: headingStyle4,
            size: 18,
            color: Colors.black,
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
            ),
            onPressed: () => Get.back(),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            _commentCard(
                teacherName: 'محمد أحمد',
                subjectName: 'اللغة العربية',
                comment: 'هناك تقصير مُلاحظ في تسليم بعض الواجبات'),
            _commentCard(
                teacherName: 'عمر عبدالله',
                subjectName: 'التربية الإسلامية',
                comment: 'هناك تقصير مُلاحظ في تسليم بعض الواجبات')
          ],
        ));
  }

  Card _commentCard(
      {required String teacherName,
      required String subjectName,
      required String comment}) {
    return Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(width: 1, color: AppColors.border)),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.black.withOpacity(.05),
                    child: Image.asset(
                      AssetsImage.comment,
                      height: 25,
                    ),
                  ),
                  const SizedBox(width: 10),
                  CustomText(
                    text: 'أ.$teacherName',
                    size: 16,
                  ),
                  const SizedBox(width: 5),
                  CustomText(
                    text: '⇠ معلم $subjectName',
                    size: 13,
                    color: AppColors.primaryClr,
                  ),
                ],
              ),
              const Divider(thickness: 2),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: CustomText(
                  text: '◄ $comment.',
                  textStyle: headingStyle5,
                  size: 15,
                ),
              ),
            ],
          ),
        ));
  }
}
