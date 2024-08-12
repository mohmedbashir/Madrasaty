import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/utils/constants.dart';
import 'package:student/utils/shared/theme.dart';
import 'package:student/view/widgets/custom%20widgets/custom_text.dart';

import '../../../controllers/subject_controller.dart';
import '../../../utils/helpers/navigation.dart';
import '../../screens/home/home_pages.dart';

class NotificationCard extends StatelessWidget {
  NotificationCard(
      {super.key,
      required this.announcementType,
      required this.subjectName,
      this.absenceDate,
      this.moreDetails});

  final SubjectController _subjectController = Get.put(SubjectController());

  final String subjectName;
  final String? absenceDate;

  final String? moreDetails;

  final NotificationType announcementType;
  @override
  Widget build(BuildContext context) {
    String _icon = AssetsImage.announcements;
    String _title = 'إعلان';
    String _details = '';
    Function()? _onTap;

    switch (announcementType) {
      case NotificationType.activity:
        _icon = AssetsImage.activity;
        _title = 'نشاط';
        _details = 'تم إدراج نشاط جديد في مادة';
        _onTap = () => Navigate.to(
              ActivityDetailsPage(subjectName: subjectName),
            );
        break;
      case NotificationType.mark:
        _icon = AssetsImage.mark;
        _title = 'درجة';
        _details = 'تم رصد درجة جديدة لمادة';
        _onTap = () {
          Navigate.to(
            SubjectDetailsPage(
              subjectName: subjectName,
              fromNotificationsPage: true,
            ),
          );
        };
        break;
      case NotificationType.homework:
        _icon = AssetsImage.homework;
        _title = 'واجب';
        _details = 'تم إدراج واجب جديد لمادة';
        _onTap = () => Navigate.to(
              HomeworkDetailsPage(subjectName: subjectName),
            );

        break;
      case NotificationType.exam:
        _icon = AssetsImage.exam;
        _title = 'إختبار';
        _details = 'هناك اختبار قادم في مادة';
        _onTap = () => Navigate.to(
              AnnouncementsDetailsPage(subjectName: subjectName),
            );

        break;
      case NotificationType.comment:
        _icon = AssetsImage.comment;
        _title = 'ملاحظة';
        _details = 'لديك ملاحظة من معلّم';
        _onTap = () => Navigate.to(
              CommentsPage(),
            );
        break;
      case NotificationType.absence:
        _icon = AssetsImage.absence;
        _title = 'إشعار غياب';
        _details = 'لقد تغيّبت عن المدرسة يوم';
        _onTap = () => Navigate.to(
              AttendencePage(),
            );
        break;

      default:
        _icon = AssetsImage.announcements;
        _title = 'إعلان';
        _details = 'يوجد إعلان جديد من معلّم';
        _onTap = () => Navigate.to(
              AnnouncementsDetailsPage(subjectName: subjectName),
            );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(width: 1, color: AppColors.border)),
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: _onTap,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.black.withOpacity(.05),
                                child: Image.asset(
                                  _icon,
                                  height: 25,
                                ),
                              ),
                              const SizedBox(width: 10),
                              CustomText(
                                text: _title,
                                size: 16,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 7),
                            child: Container(
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.centerRight,
                                      end: Alignment.centerLeft,
                                      colors: [Colors.grey, Colors.white])),
                              height: 1.5,
                              width: _title.length * 15 + 40,
                            ),
                          ),
                          SizedBox(height: 2),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: CustomText(
                          text: announcementType != NotificationType.absence
                              ? '▪  $_details ' '$subjectName.'
                              : '▪  $_details ' '$absenceDate.',
                          textStyle: headingStyle5,
                          size: 15,
                        ),
                      ),
                      moreDetails != null
                          ? Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: CustomText(
                                text: '◄ $moreDetails.',
                                textStyle: headingStyle5,
                                size: 16,
                              ),
                            )
                          : Container(),
                    ],
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.black26,
                    size: 22,
                  )
                ],
              ),
            ),
          )),
    );
  }
}

enum NotificationType {
  announcement,
  exam,
  homework,
  mark,
  comment,
  activity,
  absence
}
