import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/controllers/notifications_controller.dart';
import 'package:student/controllers/subject_controller.dart';
import 'package:student/utils/shared/theme.dart';
import 'package:student/view/widgets/custom%20widgets/notification_card.dart';

import '../../widgets/custom widgets/custom_widgets.dart';

class NotificationsPage extends StatelessWidget {
  NotificationsPage({super.key});
  final NotificationsController _notificationsController =
      Get.put(NotificationsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: CustomText(
            text: 'الإشعارات',
            textStyle: headingStyle4,
            color: Colors.black,
            size: 18,
          ),
          actions: [
            GetBuilder<NotificationsController>(
              builder: (controller) => Switch(
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.grey.shade300,
                value: controller.notificationsSwitchValue,
                onChanged: (value) {
                  controller.changeNotificationsSwitchValue(value);
                },
              ),
            )
          ],
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 110),
          children: [
            NotificationCard(
              announcementType: NotificationType.comment,
              subjectName: 'اللغة العربية',
            ),
            NotificationCard(
              announcementType: NotificationType.absence,
              subjectName: 'اللغة العربية',
            ),
            /*   NotificationCard(
              announcementType: NotificationType.exam,
              subjectName: 'اللغة العربية',
            ),
            NotificationCard(
              announcementType: NotificationType.homework,
              subjectName: 'اللغة العربية',
            ), */
          ],
        ));
  }
}
