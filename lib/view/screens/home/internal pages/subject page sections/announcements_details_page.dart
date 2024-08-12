import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/models/activity.dart';
import 'package:student/services/get_avtivities.dart';
import 'package:student/utils/constants.dart';
import 'package:student/utils/shared/theme.dart';

import '../../../../widgets/custom widgets/custom_widgets.dart';

class AnnouncementsDetailsPage extends StatelessWidget {
  const AnnouncementsDetailsPage(
      {super.key, required this.subjectName, this.subjectId});
  final String subjectName;
  final int? subjectId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: CustomText(
            text: 'الإعلانات',
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
        body: FutureBuilder(
          future:
              GetActivities().getActivities(subjectId: subjectId!, type: 'ads'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (!snapshot.hasData) {
              return Center(
                  child: CustomText(text: "لا يوجد أي اعلانات حتى الان"));
            } else {
              List<Activity> ads = snapshot.data!;
              if (ads.isEmpty) {
                return Center(
                    child: CustomText(
                  text: "لا يوجد أي اعلانات حتى الان",
                  size: 14,
                ));
              } else {
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(15),
                  itemCount: ads.length,
                  itemBuilder: (context, index) => AnnouncementCard(
                    icon: AssetsImage.exam,
                    subjectName: subjectName,
                    title: ads[index].title!,
                    announcementDetails: ads[index].description!,
                    date: ads[index].endDate!,
                  ),
                );
              }
            }
          },
        ));
  }
}
