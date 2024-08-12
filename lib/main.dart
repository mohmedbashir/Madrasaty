import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/prefs/student_preferences_controller.dart';
import 'package:student/utils/helpers/bindings.dart';
import 'package:student/view/screens/auth/login.dart';
import 'package:student/view/screens/home/home.dart';

import 'utils/shared/theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await StudentPreferencesController().initSharePrefs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      textDirection: TextDirection.rtl,
      initialBinding: AppBindings(),
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      home: LoginScreen(),
    );
  }
}
