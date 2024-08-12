import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/controllers/subject_controller.dart';
import 'package:student/models/mark.dart';
import 'package:student/services/get_marks.dart';
import 'package:student/utils/constants.dart';
import 'package:student/utils/helpers/navigation.dart';
import 'package:student/utils/shared/theme.dart';
import 'package:student/utils/size_config.dart';
import '../../../../widgets/custom widgets/custom_widgets.dart';
import '../../home_pages.dart';

class SubjectDetailsPage extends StatelessWidget {
  const SubjectDetailsPage(
      {super.key,
      required this.subjectName,
      this.fromNotificationsPage,
      this.sujectId});
  final String subjectName;
  final int? sujectId;
  final bool? fromNotificationsPage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: CustomText(
          text: subjectName,
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
      body: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(15),
          children: [
            fromNotificationsPage == true
                ? Container()
                : const SubjectPageSectionButtons(),
            const SizedBox(height: 15),
            GetBuilder<SubjectController>(
              builder: (controller) => fromNotificationsPage == true
                  ? _marks()
                  : controller.selectedSection == 'subject'
                      ? _subject()
                      : _marks(subjectId: sujectId),
            )
          ]),
    );
  }

  Widget _marks({int? subjectId}) {
    return FutureBuilder(
      future: GetMarks().getMarks(subjectId: subjectId!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (!snapshot.hasData) {
          return Center(
              child: CustomText(
            text: "لم يتم رصد الدرجات بعد",
            size: 14,
          ));
        } else {
          List<Mark> subjectmarks = snapshot.data!;
          int totalMarks =
              subjectmarks.fold(0, (sum, exam) => sum + (exam.mark));
          print(totalMarks);
          return Column(
            children: [
              _marksDetails(
                medMark: subjectmarks.where((element) => element.id == 2).first,
                activitiesMark:
                    subjectmarks.where((element) => element.id == 3).first,
                finalMark:
                    subjectmarks.where((element) => element.id == 1).first,
              ),
              const SizedBox(height: 5),
              _totalMark(totalMark: totalMarks),
            ],
          );
        }
      },
    );
  }

  Column _subject() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionCard(
          sectionName: 'الإعلانات',
          sectionImage: AssetsImage.announcements,
          onTap: () => Navigate.to(AnnouncementsDetailsPage(
              subjectName: subjectName, subjectId: sujectId)),
        ),
        SectionCard(
          sectionName: 'الواجبات',
          sectionImage: AssetsImage.homework,
          onTap: () => Navigate.to(HomeworkDetailsPage(
            subjectName: subjectName,
            subjectId: sujectId,
          )),
        ),
        SectionCard(
          sectionName: 'الأنشطة ',
          sectionImage: AssetsImage.activity,
          onTap: () => Navigate.to(ActivityDetailsPage(
              subjectName: subjectName, subjectId: sujectId)),
        ),
      ],
    );
  }

  SizedBox _totalMark({required int totalMark}) {
    return SizedBox(
      height: UI.height * .075,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(color: AppColors.border, width: 1)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'الإجمالي',
                  size: 18,
                ),
                Row(
                  children: [
                    CustomText(
                      text: totalMark.toString(),
                      color: AppColors.primaryClr,
                      size: 19,
                    ),
                    SizedBox(width: UI.width * .15),
                    CustomText(
                      text: '100',
                      size: 19,
                    ),
                    SizedBox(width: UI.width * .06),
                  ],
                ),
              ]),
        ),
      ),
    );
  }

  SizedBox _marksDetails({
    required Mark medMark,
    required Mark activitiesMark,
    required Mark finalMark,
  }) {
    return SizedBox(
      // height: UI.height * .305,
      child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(color: AppColors.border, width: 1)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'التقييم',
                      size: 18,
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: 'الدرجة',
                          size: 18,
                        ),
                        SizedBox(width: UI.width * .1),
                        CustomText(
                          text: 'المدى',
                          size: 18,
                        ),
                        SizedBox(width: UI.width * .02),
                      ],
                    ),
                  ],
                ),
                const Divider(color: AppColors.border, thickness: 2),
                // _month1(),
                // const Divider(color: AppColors.border, thickness: 1),
                _med(mark: medMark.mark, totalMark: medMark.total_marks),
                const Divider(color: AppColors.border, thickness: 1),
                // _month2(),
                // const Divider(color: AppColors.border, thickness: 1),
                _avtivities(
                    mark: activitiesMark.mark,
                    totalMark: activitiesMark.total_marks),
                const Divider(color: AppColors.border, thickness: 1),
                _final(mark: finalMark.mark, totalMark: finalMark.total_marks),
              ],
            ),
          )),
    );
  }

  Row _final({
    required int mark,
    required int totalMark,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: 'الاختبار النهائي',
          size: 16,
          textStyle: headingStyle4,
        ),
        Row(
          children: [
            CustomText(
              text: mark.toString(),
              size: 18,
              textStyle: headingStyle4,
              color: AppColors.primaryClr,
            ),
            SizedBox(width: UI.width * .17),
            CustomText(
              text: totalMark.toString(),
              size: 18,
              textStyle: headingStyle4,
            ),
            SizedBox(width: UI.width * .065),
          ],
        ),
      ],
    );
  }

  Row _avtivities({
    required int mark,
    required int totalMark,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: 'أعمال السنة',
          size: 17,
          textStyle: headingStyle4,
        ),
        Row(
          children: [
            CustomText(
              text: mark.toString(),
              size: 18,
              textStyle: headingStyle4,
              color: AppColors.primaryClr,
            ),
            SizedBox(width: UI.width * .18),
            CustomText(
              text: totalMark.toString(),
              size: 18,
              textStyle: headingStyle5,
            ),
            SizedBox(width: UI.width * .07),
          ],
        ),
      ],
    );
  }

  Row _month2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: 'اختبار الشهر 2',
          size: 17,
          textStyle: headingStyle5,
        ),
        Row(
          children: [
            CustomText(
              text: '10',
              size: 18,
              textStyle: headingStyle5,
              color: AppColors.primaryClr,
            ),
            SizedBox(width: UI.width * .18),
            CustomText(
              text: '10',
              size: 18,
              textStyle: headingStyle5,
            ),
            SizedBox(width: UI.width * .07),
          ],
        ),
      ],
    );
  }

  Row _med({
    required int mark,
    required int totalMark,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: 'الاختبار النصفي',
          size: 16,
          textStyle: headingStyle4,
        ),
        Row(
          children: [
            CustomText(
              text: mark.toString(),
              size: 18,
              textStyle: headingStyle4,
              color: AppColors.primaryClr,
            ),
            SizedBox(width: UI.width * .17),
            CustomText(
              text: totalMark.toString(),
              size: 18,
              textStyle: headingStyle4,
            ),
            SizedBox(width: UI.width * .065),
          ],
        ),
      ],
    );
  }

  Row _month1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: 'اختبار الشهر 1',
          size: 17,
          textStyle: headingStyle5,
        ),
        Row(
          children: [
            CustomText(
              text: '10',
              size: 18,
              textStyle: headingStyle5,
              color: AppColors.primaryClr,
            ),
            SizedBox(width: UI.width * .18),
            CustomText(
              text: '10',
              size: 18,
              textStyle: headingStyle5,
            ),
            SizedBox(width: UI.width * .07),
          ],
        ),
      ],
    );
  }
}
