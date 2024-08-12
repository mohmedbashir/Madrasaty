import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:student/utils/constants.dart';
import 'package:student/view/screens/auth/login.dart';

class OnboardingController extends GetxController {
  int currentPage = 0;
  late PageController pageController;
  next() {
    currentPage++;
    if (currentPage > StaticData.onBoardingList.length - 1) {
      Get.offAll(() =>  LoginScreen());
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }

  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
