import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/controllers/home_controller.dart';
import 'package:student/models/profile.dart';
import 'package:student/services/get_avtivities.dart';
import 'package:student/services/get_marks.dart';
import 'package:student/services/get_profile.dart';
import 'package:student/services/get_subjects.dart';
import 'package:student/utils/constants.dart';
import 'package:student/utils/shared/theme.dart';
import '../../../utils/size_config.dart';
import '../../widgets/custom widgets/custom_widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    UI.init(context);
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        extendBody: controller.bnbIndex == 2 ? false : true,
        backgroundColor: Colors.grey.shade200,
        appBar: controller.bnbIndex == 0 ? _appBar() : null,
        body: controller.body,
        bottomNavigationBar: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(35),
                  topLeft: Radius.circular(35),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(-.1, -.1),
                      blurRadius: 5)
                ]),
            child: _bnb(controller)),
        /*  floatingActionButton: FloatingActionButton(onPressed: () async {
          var acts =
              await GetActivities().getActivities(subjectId: 2, type: 'ads');
          // print(acts[0]);
        }), */
      ),
    );
  }

  Widget _bnb(HomeController controller) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(35),
            topLeft: Radius.circular(35),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, offset: Offset(-1, -1), blurRadius: 5)
          ]),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(35),
          topLeft: Radius.circular(35),
        ),
        child: Container(
          height: UI.height * .1,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(color: Colors.black45, blurRadius: 5.0),
            ],
          ),
          child: BottomNavigationBar(
            selectedFontSize: 1,
            unselectedFontSize: 1,
            currentIndex: controller.bnbIndex,
            onTap: (value) => controller.selectIndex(value),
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      const SizedBox(height: 10),
                      Image.asset(
                        AssetsImage.main,
                        height: 30,
                      ),
                      const SizedBox(height: 5),
                      CustomText(
                        text: 'الرئيسية',
                        textStyle: headingStyle6,
                        size: 13,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  activeIcon: Column(
                    children: [
                      const SizedBox(height: 10),
                      Image.asset(
                        AssetsImage.main_selected,
                        height: 35,
                      ),
                      const SizedBox(height: 10),
                      const CircleAvatar(
                        radius: 3,
                        backgroundColor: AppColors.primaryClr,
                      )
                    ],
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      const SizedBox(height: 10),
                      Image.asset(
                        AssetsImage.notification,
                        height: 35,
                      ),
                      const SizedBox(height: 5),
                      CustomText(
                        text: 'الإشعارات',
                        textStyle: headingStyle6,
                        size: 13,
                      )
                    ],
                  ),
                  activeIcon: Column(
                    children: [
                      const SizedBox(height: 10),
                      Image.asset(
                        AssetsImage.notification_selected,
                        height: 35,
                      ),
                      const SizedBox(height: 10),
                      const CircleAvatar(
                        radius: 3,
                        backgroundColor: AppColors.primaryClr,
                      )
                    ],
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      const SizedBox(height: 10),
                      Image.asset(
                        AssetsImage.messages,
                        height: 30,
                      ),
                      const SizedBox(height: 5),
                      CustomText(
                        text: 'الرسائل',
                        textStyle: headingStyle6,
                        size: 13,
                      )
                    ],
                  ),
                  activeIcon: Column(
                    children: [
                      const SizedBox(height: 10),
                      Image.asset(
                        AssetsImage.messages_selected,
                        height: 35,
                      ),
                      const SizedBox(height: 10),
                      const CircleAvatar(
                        radius: 3,
                        backgroundColor: AppColors.primaryClr,
                      )
                    ],
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      const SizedBox(height: 10),
                      Image.asset(
                        AssetsImage.person,
                        height: 30,
                      ),
                      const SizedBox(height: 5),
                      CustomText(
                        text: 'الحساب',
                        textStyle: headingStyle6,
                        size: 13,
                      )
                    ],
                  ),
                  activeIcon: Column(
                    children: [
                      const SizedBox(height: 10),
                      Image.asset(
                        AssetsImage.person_selected,
                        height: 35,
                      ),
                      const SizedBox(height: 10),
                      const CircleAvatar(
                        radius: 3,
                        backgroundColor: AppColors.primaryClr,
                      )
                    ],
                  ),
                  label: ''),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSize _appBar() {
    return PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: AppBar(
          backgroundColor: AppColors.primaryClr,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35))),
          title: CustomText(
            text: 'مرحباً بِك',
            textStyle: headingStyle4,
            color: Colors.white,
          ),
          bottom: PreferredSize(
            preferredSize: Size.zero,
            child: Container(
              padding: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              height: 50,
              child: TextFormField(
                  style: const TextStyle(color: Colors.black, fontSize: 22),
                  decoration: const InputDecoration(
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Icon(
                          Icons.search,
                          color: AppColors.primaryClr,
                          size: 30,
                        ),
                      ),
                      border: OutlineInputBorder(borderSide: BorderSide.none))),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {},
                child: Image.asset(
                  AssetsImage.notification_appBar,
                  width: 35,
                ),
              ),
            )
          ],
        ));
  }
}
