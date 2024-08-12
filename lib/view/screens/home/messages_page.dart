import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/utils/constants.dart';
import 'package:student/utils/shared/theme.dart';
import 'package:student/utils/size_config.dart';
import 'package:student/view/screens/home/internal%20pages/messages%20pages/send_message_page.dart';

import '../../widgets/custom widgets/custom_widgets.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: CustomText(
            text: 'الرسائل',
            textStyle: headingStyle4,
            color: Colors.black,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
          child: Column(
            children: [
              _searchBar(),
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    _messageCard(
                      teacherName: 'محمد أحمد',
                      subjectName: 'اللغة العربية',
                      message:
                          'سيتم تعويض الطلاب الذين تغيّبوا عن الاختبار السابق.',
                    ),
                    _messageCard(
                      teacherName: 'عمر عبدالله',
                      subjectName: 'الرياضيات',
                      message:
                          'سيتم تعويض الطلاب الذين تغيّبوا عن الاختبار السابق.',
                    ),
                    _messageCard(
                      teacherName: 'أحمد خالد',
                      subjectName: 'التربية الإسلامية',
                      message:
                          'سيتم تعويض الطلاب الذين تغيّبوا عن الاختبار السابق.',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButton: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black38, offset: Offset(1, 1), blurRadius: 5)
              ]),
          width: UI.width * .40,
          height: 60,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: ElevatedButton(
              onPressed: () => Get.to(SendMessgagePage()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'إرسال رسالة',
                    textStyle: headingStyle5,
                    size: 18,
                  ),
                  const Icon(Icons.send),
                ],
              ),
            ),
          ),
        ));
  }

  Padding _searchBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                offset: Offset(1, 1), color: Colors.black26, blurRadius: 3)
          ],
          border: Border.all(width: 1, color: Colors.black12),
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        height: 50,
        child: TextFormField(
            style: const TextStyle(color: Colors.black, fontSize: 22),
            cursorColor: AppColors.border,
            decoration: const InputDecoration(
                suffixIcon: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Icon(
                    Icons.search,
                    color: Colors.black38,
                    size: 30,
                  ),
                ),
                border: OutlineInputBorder(borderSide: BorderSide.none))),
      ),
    );
  }

  Widget _messageCard({
    required String teacherName,
    required String subjectName,
    required String message,
  }) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25)),
              side: const BorderSide(color: AppColors.border)),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.black.withOpacity(.03),
                  child: Image.asset(
                    AssetsImage.teacher,
                    height: 60,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
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
                  const SizedBox(height: 8),
                  SizedBox(
                    width: UI.width * .6,
                    child: CustomText(
                      text: message,
                      size: 13,
                      textStyle: headingStyle5,
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ));
  }
}
