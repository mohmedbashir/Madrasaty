import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:student/utils/constants.dart';
import 'package:student/utils/shared/theme.dart';
import 'package:student/utils/size_config.dart';

import '../../../../widgets/custom widgets/custom_widgets.dart';

class ChatPage extends StatelessWidget {
  const ChatPage(
      {super.key, required this.teacherName, required this.subjectName});
  final String teacherName;
  final String subjectName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'أ.$teacherName',
              textStyle: headingStyle4,
              color: Colors.black,
              size: 18,
            ),
            CustomText(
              text: 'معلّم $subjectName',
              textStyle: headingStyle4,
              color: AppColors.primaryClr,
              size: 12,
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
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              color: AppColors.primaryClr,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  child: CustomText(
                    text:
                        'مرحبا أستاذ محمد ، هل ستقوم بتعويض الطلبة المعتذرين عن اختبار اليوم ؟',
                    size: 15,
                    textStyle: headingStyle5,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    width: UI.width * .75,
                    child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 5,
                        style: const TextStyle(
                            color: Colors.black, fontSize: 22),
                        cursorColor: AppColors.border,
                        decoration: InputDecoration(
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: const BorderSide(
                                    color: Colors.black12, width: 1)),
                            filled: true,
                            fillColor: Colors.white,
                            focusColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: const BorderSide(
                                    color: Colors.black12, width: 1)))),
                  ),
                  Spacer(),
                  CircleAvatar(
                    backgroundColor: AppColors.primaryClr,
                    radius: 30,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 35,
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
