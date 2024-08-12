import 'package:flutter/material.dart';
import 'package:student/models/onboardingmodel.dart';

class AssetsImage {
  static const String basePath = 'assets/images';

  static const String onboarding1 = '$basePath/onboarding1.png';
  static const String onboarding2 = '$basePath/onboarding2.png';
  static const String onboarding3 = '$basePath/onboarding3.png';

  static const String login = '$basePath/login.png';
  static const String arabic = '$basePath/arabic.png';
  static const String math = '$basePath/tools.png';
  static const String islamic = '$basePath/praying.png';
  static const String science = '$basePath/science.png';
  static const String arts = '$basePath/paint-palette.png';
  static const String english = '$basePath/writing.png';
  static const String technology = '$basePath/robot.png';
  static const String social = '$basePath/globe.png';
  static const String comment = '$basePath/comment.png';

  static const String announcements = '$basePath/announcement.png';
  static const String homework = '$basePath/homework.png';
  static const String person_ = '$basePath/person.png';
  static const String activity = '$basePath/goal.png';
  static const String exam = '$basePath/exam.png';
  static const String absence = '$basePath/absence.png';
  static const String mark = '$basePath/mark.png';

  static const String notification_appBar = '$basePath/notification-appbar.png';
  static const String notification = '$basePath/notification.png';
  static const String notification_selected =
      '$basePath/notification-selected.png';
  static const String person = '$basePath/person.png';
  static const String person_selected = '$basePath/person-selected.png';
  static const String main = '$basePath/main.png';
  static const String main_selected = '$basePath/main-selected.png';
  static const String messages = '$basePath/message.png';
  static const String messages_selected = '$basePath/message-selected.png';

  static const String student = '$basePath/student.png';
  static const String teacher = '$basePath/teacher.png';
  static const String information = '$basePath/information.png';
  static const String attendance = '$basePath/attendance.png';
  static const String logout = '$basePath/logout.png';

  static const String ts = '$basePath/ts.png';
}

class AppColors {
  static const MaterialColor primaryClr = MaterialColor(
    0xff4480ad,
    <int, Color>{
      50: Color(0xff4480ad),
      100: Color(0xff4480ad),
      200: Color(0xff4480ad),
      300: Color(0xff4480ad),
      400: Color(0xff4480ad),
      500: Color(0xff4480ad),
      600: Color(0xff4480ad),
      700: Color(0xff4480ad),
      800: Color(0xff4480ad),
      900: Color(0xff4480ad),
    },
  );
  static const MaterialColor darkPrimaryClr = MaterialColor(
    0xff11212c,
    <int, Color>{
      50: Color(0xff11212c),
      100: Color(0xff11212c),
      200: Color(0xff11212c),
      300: Color(0xff11212c),
      400: Color(0xff11212c),
      500: Color(0xff11212c),
      600: Color(0xff11212c),
      700: Color(0xff11212c),
      800: Color(0xff11212c),
      900: Color(0xff11212c),
    },
  );

  static const Color border = Colors.black12;
}

class StaticData {
  static List<OnboardingContents> onBoardingList = [
    OnboardingContents(
      title: "مرحباً  بك في مدرستي ",
      image: AssetsImage.onboarding1,
      desc:
          "التطبيق الأفضل لمساعدتك على تتبع العلامات، الأنشطة المدرسية، الواجبات المزلية، وغير ذلك الكثير",
    ),
    OnboardingContents(
      title: "تتبع نشاط وأداء أطفالك اليومي",
      image: AssetsImage.onboarding2,
      desc:
          "يمكنك تتبع جميع علامات طفلك فقط باسخدام الهاتف الذكي. تظهر جميع العلامات في الوقت الفعلي",
    ),
    OnboardingContents(
      title: "اجعل أطفالك تحت السيطرة",
      image: AssetsImage.onboarding3,
      desc: "انضم الينا واجعل حياتك وحياة أطفالك المدرسية أسهل",
    ),
  ];
}
