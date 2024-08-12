import 'package:get/get.dart';
import 'package:student/controllers/home_controller.dart';
import 'package:student/controllers/onboarding_controller.dart';
import 'package:student/controllers/subject_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => SubjectController());
    Get.lazyPut(() => OnboardingController());
  }
}
