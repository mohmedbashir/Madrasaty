import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/utils/shared/theme.dart';

import '../../../../widgets/custom widgets/custom_widgets.dart';

class TechnicalSupportPage extends StatelessWidget {
  const TechnicalSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: CustomText(
            text: 'الدعم الفني',
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
        body: Center(
          child: CustomText(
            text:
                'في حال وجود أيّة ملاحظات على التطبيق يرجى التواصل على الرقم 0592901480',
            textStyle: headingStyle5,
          ),
        ));
  }
}
