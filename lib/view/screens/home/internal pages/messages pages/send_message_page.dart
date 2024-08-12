import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/utils/constants.dart';
import 'package:student/utils/shared/theme.dart';
import 'package:student/view/screens/home/internal%20pages/messages%20pages/chat_page.dart';

import '../../../../widgets/custom widgets/custom_widgets.dart';

class SendMessgagePage extends StatelessWidget {
  const SendMessgagePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Column(
          children: [
            CustomText(
              text: 'إرسال رسالة',
              textStyle: headingStyle4,
              color: Colors.black,
              size: 18,
            ),
          ],
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
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: CustomText(
              text: 'اختر المعلّم الذي توَدّ إرسال رسالة إليه :',
              size: 17,
              textStyle: headingStyle5,
            ),
          ),
          _contact(teacherName: 'محمد أحمد', subjectName: 'اللغة العربية'),
          _contact(teacherName: 'عمر خالد', subjectName: 'الرياضيات'),
          _contact(
              teacherName: 'أحمد خالد', subjectName: 'التربية الإسلامية'),
        ],
      ),
    );
  }

  Padding _contact({required String teacherName, required String subjectName}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: AppColors.border)),
        color: Colors.white,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () => Get.to(
              ChatPage(teacherName: teacherName, subjectName: subjectName)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.black.withOpacity(.03),
                          child: Image.asset(
                            AssetsImage.teacher,
                            height: 50,
                          ),
                        ),
                      ),
                      CustomText(
                        text: 'أ.$teacherName',
                        size: 15,
                      ),
                      const SizedBox(width: 5),
                      CustomText(
                        text: '⇠ $subjectName',
                        size: 13,
                        color: AppColors.primaryClr,
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.black26,
                    size: 22,
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
