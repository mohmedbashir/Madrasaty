import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/controllers/onboarding_controller.dart';

import 'package:student/view/widgets/onboarding/boardingpage.dart';
import 'package:student/view/widgets/onboarding/custom_button.dart';
import 'package:student/view/widgets/onboarding/dot.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
  final controller=  Get.put(OnboardingController());
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              const Expanded(flex: 4, child: Boarding()),
              Expanded(
                  flex: 1,
                  child: Column(
                    children:  [
                      MyDot(),
                      Spacer(
                        flex: 2,
                      ),
                       CustomButton(
                      label: "التالي",
                      onPressed: () {
                       controller .next();
                      },
                    ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
