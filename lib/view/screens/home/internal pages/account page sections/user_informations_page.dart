import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:student/models/profile.dart';
import 'package:student/services/get_profile.dart';
import 'package:student/utils/shared/theme.dart';

import '../../../../widgets/custom widgets/custom_widgets.dart';

class UserInformationsPage extends StatelessWidget {
  const UserInformationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: CustomText(
            text: 'تفاصيل المستخدم',
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
          future: GetProfile().getProfile(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (!snapshot.hasData) {
              return Center(
                child: Text("لا يوجد بيانات."),
              );
            } else {
              Profile profile = snapshot.data!;
              return ListView(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(15),
                children: [
                  UserInformationsPageSection(
                    title: 'الإسم',
                    content: profile.name,
                  ),
                  UserInformationsPageSection(
                    title: 'رقم الهوية',
                    content: profile.nationalId,
                  ),
                  UserInformationsPageSection(
                    title: 'رقم الجوال',
                    content: profile.mobile,
                  ),
                  UserInformationsPageSection(
                    title: 'الدولة',
                    content: 'فلسطين',
                  ),
                  UserInformationsPageSection(
                    title: 'المدينة',
                    content: 'غزة ',
                  ),
                ],
              );
            }
          },
        ));
  }
}
