import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/controllers/onboarding_controller.dart';
import 'package:student/utils/constants.dart';
import 'package:student/view/widgets/custom%20widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.label});
  final Function()? onPressed;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.primaryClr, borderRadius: BorderRadius.circular(15)),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        onPressed: onPressed,
        child: CustomText(
          text: label,
          color: Colors.white,
        ),
      ),
    );
  }
}
