import 'package:flutter/material.dart';
import 'package:student/utils/constants.dart';
import 'package:student/utils/shared/theme.dart';
import 'package:student/view/widgets/custom%20widgets/custom_text.dart';

class AnnouncementCard extends StatelessWidget {
  const AnnouncementCard(
      {super.key,
      required this.icon,
      required this.subjectName,
      required this.title,
      required this.announcementDetails,
      this.date});
  final String icon;
  final String subjectName;
  final String title;
  final String announcementDetails;
  final String? date;
  @override
  Widget build(BuildContext context) {
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
                      icon,
                      height: 25,
                    ),
                  ),
                  const SizedBox(width: 10),
                  CustomText(
                    text: title,
                    size: 17,
                  ),
                  const SizedBox(width: 10),
                  CustomText(
                    text: '⇠ $subjectName',
                    size: 15,
                    color: AppColors.primaryClr,
                  ),
                ],
              ),
              const Divider(thickness: 2),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: CustomText(
                  text: '◄ $announcementDetails. ',
                  textStyle: headingStyle5,
                  size: 16,
                ),
              ),
              date != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CustomText(
                        text: '◄ $date.',
                        textStyle: headingStyle5,
                        size: 16,
                      ),
                    )
                  : Container(),
            ],
          ),
        ));
  }
}
