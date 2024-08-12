import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/utils/constants.dart';
import 'package:student/utils/shared/theme.dart';

import '../../../../widgets/custom widgets/custom_widgets.dart';

class AnsenceDaysPreview extends StatelessWidget {
  const AnsenceDaysPreview({super.key, required this.absenceDaysNumber});
  final double absenceDaysNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: CustomText(
          text: 'عرض أيام الغياب',
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
      body: Container(
        padding: const EdgeInsets.all(15),
        height: 120 + (absenceDaysNumber * 38),
        child: Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      right: 15, left: 32, bottom: 10, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'اليوم',
                        textStyle: headingStyle4,
                        size: 18,
                      ),
                      CustomText(
                        text: 'التاريخ',
                        textStyle: headingStyle4,
                        size: 18,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: absenceDaysNumber * 38,
                  child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        _singleAbsence(day: 'الأحد', date: '22/3/2023'),
                        _singleAbsence(day: 'الخميس', date: '22/3/2023'),
                        _singleAbsence(day: 'السبت', date: '22/3/2023'),
                        _singleAbsence(day: 'الثلاثاء', date: '22/3/2023'),
                        _singleAbsence(day: 'الإربعاء', date: '22/3/2023'),
                        _singleAbsence(day: 'الأحد', date: '22/3/2023'),
                        _singleAbsence(day: 'الأحد', date: '22/3/2023'),
                        _singleAbsence(day: 'الخميس', date: '22/3/2023'),
                        _singleAbsence(day: 'السبت', date: '22/3/2023'),
                        _singleAbsence(day: 'الثلاثاء', date: '22/3/2023'),
                        _singleAbsence(day: 'الإربعاء', date: '22/3/2023'),
                        _singleAbsence(day: 'الأحد', date: '22/3/2023'),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _singleAbsence({required String day, required String date}) {
    return Column(
      children: [
        const Divider(
          color: AppColors.border,
          thickness: 2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: day,
                size: 17,
                textStyle: headingStyle6,
              ),
              CustomText(
                text: date,
                size: 18,
                textStyle: headingStyle6,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
