import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/utils/constants.dart';
import 'package:student/utils/shared/theme.dart';
import 'package:student/utils/size_config.dart';

import '../../../../widgets/custom widgets/custom_widgets.dart';

class LecturesTablePage extends StatelessWidget {
  const LecturesTablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: CustomText(
            text: 'الجدول الدراسي',
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
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SizedBox(
            height: UI.height * .38,
            child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side:
                        const BorderSide(color: AppColors.border, width: 1)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 15),
                  child: Row(
                    children: [
                      _days(),
                      const VerticalDivider(
                        color: Colors.black26,
                        thickness: 1.5,
                      ),
                      SizedBox(
                        height: UI.height * .37,
                        width: UI.width * .595,
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              _lectures('الأولى'),
                              _lectures('الثانية'),
                              _lectures('الثالثة'),
                              _lectures('الرابعة'),
                              _lectures('الخامسة'),
                              _lectures('السادسة'),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ));
  }

  Widget _lectures(String title) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: title,
              size: 16,
            ),
            Container(height: 1.5, width: 60, color: Colors.black26),
            CustomText(
              text: 'رياضيات',
              textStyle: headingStyle5,
              size: 14,
            ),
            Container(height: .7, width: 60, color: Colors.black26),
            CustomText(
              text: 'إسلامية',
              textStyle: headingStyle5,
              size: 14,
            ),
            Container(height: .7, width: 60, color: Colors.black26),
            CustomText(
              text: 'عربية',
              textStyle: headingStyle5,
              size: 14,
            ),
            Container(height: .7, width: 60, color: Colors.black26),
            CustomText(
              text: 'إتجليزية',
              textStyle: headingStyle5,
              size: 14,
            ),
            Container(height: .7, width: 60, color: Colors.black26),
            CustomText(
              text: 'فنون',
              textStyle: headingStyle5,
              size: 14,
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                height: .7,
                width: 60,
                color: Colors.black26),
            CustomText(
              text: 'تكنولوجيا',
              textStyle: headingStyle5,
              size: 14,
            ),
          ],
        ),
        title == 'السادسة'
            ? Container()
            : VerticalDivider(
                color: Colors.black26,
                width: 1.5,
              )
      ],
    );
  }

  Column _days() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: 'اليوم',
          size: 18,
        ),
        Container(height: 1.5, width: 60, color: Colors.black26),
        CustomText(
          text: 'السبت',
          textStyle: headingStyle4,
          size: 16,
        ),
        Container(height: .7, width: 60, color: Colors.black26),
        CustomText(
          text: 'الأحد',
          textStyle: headingStyle4,
          size: 16,
        ),
        Container(height: .7, width: 60, color: Colors.black26),
        CustomText(
          text: 'الإثنين',
          textStyle: headingStyle4,
          size: 16,
        ),
        Container(height: .7, width: 60, color: Colors.black26),
        CustomText(
          text: 'الثلاثاء',
          textStyle: headingStyle4,
          size: 16,
        ),
        Container(height: .7, width: 60, color: Colors.black26),
        CustomText(
          text: 'الأربعاء',
          textStyle: headingStyle4,
          size: 16,
        ),
        Container(height: .7, width: 60, color: Colors.black26),
        CustomText(
          text: 'الخميس',
          textStyle: headingStyle4,
          size: 16,
        ),
      ],
    );
  }
}
