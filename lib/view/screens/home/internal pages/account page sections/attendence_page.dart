import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/utils/constants.dart';
import 'package:student/utils/helpers/navigation.dart';
import 'package:student/utils/shared/theme.dart';
import 'package:student/utils/size_config.dart';
import '../../../../widgets/custom widgets/custom_widgets.dart';
import '../../home_pages.dart';

class AttendencePage extends StatelessWidget {
  const AttendencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: CustomText(
          text: 'الحضور والغياب',
          textStyle: headingStyle4,
          color: Colors.black,
          size: 18,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: SizedBox(
        height: UI.height * .9,
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            Row(
              children: [
                _attendenceCard(
                    title: 'أيام الحضور', number: '250', color: Colors.white),
                _attendenceCard(
                    title: 'أيام الغياب',
                    number: '6',
                    color: AppColors.primaryClr,
                    onTap: () => Navigate.to(AnsenceDaysPreview(
                          absenceDaysNumber: 6,
                        ))),
              ],
            ),
            _dateSection(title: 'اليوم', content: 'الأربعاء'),
            _dateSection(title: 'التاريخ', content: '22 / 3 / 2023'),
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        height: 60,
        width: double.infinity,
        child: MaterialButton(
          color: AppColors.primaryClr,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: () => Get.to(AnsenceDaysPreview(
            absenceDaysNumber: 6,
          )),
          child: CustomText(
            text: 'عرض أيام الغياب',
            color: Colors.white,
            size: 18,
          ),
        ),
      ),
    );
  }

  Container _dateSection({required String title, required String content}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: UI.height * .1,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(width: 1, color: AppColors.border)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: title,
                textStyle: headingStyle5,
                color: Colors.black54,
                size: 16,
              ),
              const SizedBox(height: 5),
              CustomText(
                text: content,
                textStyle: headingStyle4,
                size: 17,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _attendenceCard(
      {required String title,
      required String number,
      required Color color,
      Function()? onTap}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        height: UI.height * .12,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: AppColors.border, width: 1)),
          color: color,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: title == 'أيام الغياب' ? onTap : null,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: number,
                    color: color == Colors.white ? Colors.black : Colors.white,
                    size: 26,
                  ),
                  const SizedBox(height: 10),
                  CustomText(
                    text: title,
                    color: color == Colors.white ? Colors.black : Colors.white,
                    textStyle: headingStyle5,
                    size: 18,
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
