import 'package:flutter/material.dart';
import 'package:student/utils/constants.dart';

class Themes {
  static final light = ThemeData(
      primaryColor: AppColors.primaryClr,
      primarySwatch: AppColors.primaryClr,
      scaffoldBackgroundColor: Colors.grey.shade200,
      brightness: Brightness.light);

  static final dark = ThemeData(
      scaffoldBackgroundColor: Colors.grey.shade800,
      primaryColor: AppColors.primaryClr,
      primarySwatch: AppColors.primaryClr,
      brightness: Brightness.dark);
}

TextStyle get headingStyle1 => const TextStyle(
      fontFamily: 'Alexandria',
      fontSize: 34,
      fontWeight: FontWeight.w900,
    );
TextStyle get headingStyle2 => const TextStyle(
      fontFamily: 'Alexandria',
      fontSize: 28,
      fontWeight: FontWeight.w800,
    );
TextStyle get headingStyle3 => const TextStyle(
      fontFamily: 'Alexandria',
      fontSize: 24,
      fontWeight: FontWeight.w700,
    );
TextStyle get headingStyle4 => const TextStyle(
      fontFamily: 'Alexandria',
      fontSize: 20,
      fontWeight: FontWeight.w600,
    );
TextStyle get headingStyle5 => const TextStyle(
      fontFamily: 'Alexandria',
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
TextStyle get headingStyle6 => const TextStyle(
      fontFamily: 'Alexandria',
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );
    TextStyle get headingStyle7 => const TextStyle(
      fontFamily: 'Alexandria',
      fontSize: 12,
      fontWeight: FontWeight.w400,
    );
