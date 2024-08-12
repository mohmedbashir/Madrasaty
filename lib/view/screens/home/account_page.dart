import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/controllers/home_controller.dart';
import 'package:student/controllers/login_controller.dart';
import 'package:student/services/get_profile.dart';
import 'package:student/utils/constants.dart';
import 'package:student/utils/helpers/navigation.dart';
import 'package:student/utils/shared/theme.dart';
import 'package:student/utils/size_config.dart';
import '../../../models/profile.dart';
import '../../widgets/custom widgets/custom_widgets.dart';
import 'home_pages.dart';

class AccountPage extends StatelessWidget {
  AccountPage({super.key});
  // HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: CustomText(
          text: 'الملف الشخصي',
          textStyle: headingStyle4,
          color: Colors.black,
          size: 18,
        ),
      ),
      body: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          children: [
            SizedBox(
              height: 140,
              child: Card(
                  shadowColor: Colors.black87,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side:
                          const BorderSide(width: 1.5, color: Colors.black12)),
                  child: FutureBuilder(
                    future: GetProfile().getProfile(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (!snapshot.hasData) {
                        return Center(
                            child: CustomText(
                          text: "حدث خطأ ما.",
                          size: 14,
                        ));
                      } else {
                        Profile profile = snapshot.data!;
                        return Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: CircleAvatar(
                                  backgroundColor:
                                      Colors.black.withOpacity(.03),
                                  radius: 45,
                                  child: Image.asset(AssetsImage.student,
                                      height: 75)),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  text: profile.name,
                                  textStyle: headingStyle4,
                                  size: 17,
                                ),
                                const SizedBox(height: 10),
                                CustomText(
                                  text: profile.nationalId.toString(),
                                  textStyle: headingStyle5,
                                  size: 16,
                                ),
                              ],
                            )
                          ],
                        );
                      }
                    },
                  )),
            ),
            const SizedBox(height: 10),
            SectionCard(
              sectionImage: AssetsImage.information,
              sectionName: 'تفاصيل المستخدم',
              onTap: () => Navigate.to(UserInformationsPage()),
            ),
            SectionCard(
              sectionImage: AssetsImage.attendance,
              sectionName: 'الحضور والغياب',
              onTap: () => Navigate.to(AttendencePage()),
            ),
            /*  SectionCard(
              sectionImage: AssetsImage.comment,
              sectionName: 'الملاحظات',
              onTap: () => Navigate.to(CommentsPage()),
            ), */
            SectionCard(
              sectionImage: AssetsImage.ts,
              sectionName: 'الدعم الفني',
              onTap: () => Navigate.to(TechnicalSupportPage()),
            ),
            _signOutCard(context),
          ]),
    );
  }

  SectionCard _signOutCard(BuildContext context) {
    return SectionCard(
      sectionImage: AssetsImage.logout,
      sectionName: 'تسجيل الخروج',
      onTap: () {
        showModalBottomSheet(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25), topLeft: Radius.circular(25))),
          context: context,
          builder: (context) => ClipRRect(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(25), topLeft: Radius.circular(25)),
            child: Container(
              padding: const EdgeInsets.all(20),
              color: Colors.grey.shade200,
              height: UI.height * .3,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomText(
                      text: 'هل تريد تسجيل الخروج ؟',
                      textStyle: headingStyle4,
                      size: 18,
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: UI.height * .07,
                      width: double.infinity,
                      child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: const BorderSide(
                                  width: 1, color: AppColors.border)),
                          onPressed: () async {
                            final controller = Get.put(LoginController());
                            await controller.logout();
                          },
                          color: Colors.white,
                          child: CustomText(
                            text: 'نعم',
                          )),
                    ),
                    SizedBox(
                      height: UI.height * .07,
                      width: double.infinity,
                      child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: const BorderSide(
                                  width: 1, color: AppColors.border)),
                          onPressed: () {},
                          color: AppColors.primaryClr,
                          child: CustomText(
                            text: 'لا',
                            color: Colors.white,
                          )),
                    ),
                  ]),
            ),
          ),
        );
      },
    );
  }
}
