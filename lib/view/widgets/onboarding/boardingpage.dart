import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:student/controllers/onboarding_controller.dart';
import 'package:student/utils/constants.dart';

class Boarding extends GetView<OnboardingController> {
  const Boarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (value) {
          controller.onPageChanged(value);
        },
        itemCount: StaticData.onBoardingList.length,
        itemBuilder: ((context, index) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: SvgPicture.asset(
                    StaticData.onBoardingList[index].image,
                    height: 230,
                    width: 300,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 300,
                    child: Text(
                      StaticData.onBoardingList[index].title,
                      style: Theme.of(context).textTheme.headline1,
                      textAlign: TextAlign.center,
                    )),
                Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 300,
                    child: Text(
                      StaticData.onBoardingList[index].desc,
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.center,
                    )),
              ],
            )));
  }
}
