import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/controllers/onboarding_controller.dart';
import 'package:student/utils/constants.dart';

class MyDot extends StatelessWidget {
  const MyDot({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(builder: ((controller) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
              StaticData.onBoardingList.length,
              (index) => AnimatedContainer(
                    margin: const EdgeInsets.only(right: 10),
                    duration: const Duration(milliseconds: 500),
                    width: controller.currentPage == index ? 40 : 20,
                    height: 8,
                    decoration: BoxDecoration(
                      color: controller.currentPage == index
                          ? AppColors.primaryClr
                          : Colors.lightGreen[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ))
        ],
      );
    }));
  }
}
