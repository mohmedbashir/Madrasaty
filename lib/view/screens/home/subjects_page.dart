import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/controllers/home_controller.dart';
import 'package:student/models/subject.dart';
import 'package:student/services/get_subjects.dart';
import 'package:student/utils/shared/theme.dart';
import 'package:student/utils/size_config.dart';
import '../../widgets/custom widgets/custom_widgets.dart';
import 'home_pages.dart';

class SubjectsPage extends StatefulWidget {
  const SubjectsPage({super.key});

  @override
  State<SubjectsPage> createState() => _SubjectsPageState();
}

class _SubjectsPageState extends State<SubjectsPage> {
  @override
  void initState() {
    getSubjects();
    super.initState();
  }

  final HomeController homeController = Get.put(HomeController());
  Future getSubjects() async {
    homeController.subjects = await GetSubjects().getSubjects();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      height: UI.height * .9,
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'مقرراتي الدراسية',
                  textStyle: headingStyle4,
                  size: 20,
                ),
                TextButton(
                  onPressed: () => Get.to(LecturesTablePage()),
                  child: CustomText(
                      text: 'عرض الجدول الدراسي',
                      textStyle: headingStyle4,
                      size: 13),
                ),
              ],
            ),
          ),
          GetBuilder<HomeController>(
            init: Get.put(HomeController()),
            builder: (controller) {
              return SizedBox(
                  height: UI.height * .7,
                  child: FutureBuilder(
                    future: GetSubjects().getSubjects(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (!snapshot.hasData) {
                        return CustomText(
                          text: "لا يوجد مقررات",
                          size: 14,
                        );
                      } else {
                        List<Subject> subjects = snapshot.data!;

                        return GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.fromLTRB(12, 5, 12, 75),
                          itemCount: subjects.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 3 / 2.75,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) => _subjectCard(
                            subjectImage: subjects[index].image_url,
                            subjectId: subjects[index].id,
                            subjectName: subjects[index].name,
                          ),
                        );
                      }
                    },
                  ));
              /*  GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(12, 5, 12, 75),
                    itemCount: homeController.subjects.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 3 / 2.75,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            crossAxisCount: 2),
                    itemBuilder: (context, index) => _subjectCard(
                      subjectImage: homeController.subjects[index].image_url,
                      subjectId: homeController.subjects[index].id,
                      subjectName: homeController.subjects[index].name,
                    ),
                  )); */
            },
          )
        ],
      ),
    ));
  }

  Widget _subjectCard(
      {required String subjectName,
      required String subjectImage,
      required int subjectId}) {
    return Stack(children: [
      SizedBox(
        height: UI.width * .40,
        width: UI.width * .45,
        child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Colors.black12),
                borderRadius: BorderRadius.circular(20)),
            child: InkWell(
              onTap: () => Get.to(SubjectDetailsPage(
                subjectName: subjectName,
                sujectId: subjectId,
              )),
              borderRadius: BorderRadius.circular(20),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Image.network(subjectImage, width: UI.width * .22),
                  Spacer(),
                  CustomText(
                      text: subjectName,
                      textStyle: headingStyle5,
                      size: 18,
                      color: Colors.black87),
                  SizedBox(height: 12)
                ],
              ),
            )),
      ),
      /* const Positioned(
        top: 12,
        left: 12,
        child: CircleAvatar(
          backgroundColor: AppColors.primaryClr,
          radius: 8,
        ),
      ), */
    ]);
  }
}
