import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/controllers/subject_controller.dart';
import 'package:student/utils/constants.dart';
import 'package:student/utils/shared/theme.dart';
import 'package:student/view/widgets/custom%20widgets/custom_text.dart';

class SubjectPageSectionButtons extends StatelessWidget {
  const SubjectPageSectionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubjectController>(
      init: SubjectController(),
      builder: (controller) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: controller.selectedSection == 'subject'
                          ? AppColors.primaryClr
                          : Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      fixedSize: const Size(double.infinity, 45)),
                  onPressed: () {
                    controller.switchSelectedSection('subject');
                  },
                  child: CustomText(
                    text: 'المقرر',
                    color: controller.selectedSection == 'subject'
                        ? Colors.white
                        : AppColors.primaryClr,
                    size: 20,
                    textStyle: headingStyle5,
                  )),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: controller.selectedSection == 'grades'
                          ? AppColors.primaryClr
                          : Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      fixedSize: const Size(double.infinity, 45)),
                  onPressed: () {
                    controller.switchSelectedSection('grades');
                  },
                  child: CustomText(
                    text: 'الدرجات',
                    size: 20,
                    color: controller.selectedSection == 'grades'
                        ? Colors.white
                        : AppColors.primaryClr,
                    textStyle: headingStyle5,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
