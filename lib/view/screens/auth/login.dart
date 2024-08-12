import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/controllers/login_controller.dart';
import 'package:student/utils/shared/theme.dart';
import 'package:student/view/screens/auth/forget_password.dart';
import 'package:student/view/widgets/custom%20widgets/custom_text.dart';

import 'package:student/view/widgets/onboarding/custom_button.dart';

import '../../../utils/constants.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final controller = Get.put(LoginController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<LoginController>(builder: (context) {
          return Center(
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(15),
              children: [
                Image.asset(
                  AssetsImage.login,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: CustomText(
                    text: 'تسجيل الدخول',
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        controller: controller,
                        hintText: 'أدخل رقم الهوية المكون من 9 أرقام',
                        label: 'رقم الهوية',
                        textFieldController: controller.idController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'هناك خطأ في رقم الهوية';
                          }
                          if (value.length != 9) {
                            return 'رقم الهوية يجب أن يحتوي على 9 أرقام';
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                          isSecured: true,
                          controller: controller,
                          hintText: 'أدخل كلمة المرور الخاصة بك',
                          label: 'كلمة المرور',
                          textFieldController: controller.passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'هناك خطأ في كلمة المرور';
                            }
                            return null;
                          }),
                    ],
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Get.to(ForgetScreen());
                    },
                    child: CustomText(
                      text: 'هل نسيت كلمة المرور؟',
                      size: 15,
                    ),
                  ),
                ),
                Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.primaryClr,
                      borderRadius: BorderRadius.circular(15)),
                  child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      onPressed: () async {
                        _formKey.currentState!.save();
                        if (_formKey.currentState!.validate()) {
                          await controller.preformLogin();
                        }
                      },
                      child: controller.loading
                          ? Center(
                              child: CircularProgressIndicator(
                                  color: Colors.white),
                            )
                          : CustomText(
                              text: "تسجيل الدخول",
                              color: Colors.white,
                            )),
                )
                /*  CustomButton(
                    onPressed: () async {
                      _formKey.currentState!.save();
                      if (_formKey.currentState!.validate()) {
                        await controller.preformLogin();
                      }
                    },
                    label: "تسجيل الدخول") */
              ],
            ),
          );
        }),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    required this.textFieldController,
    this.validator,
    this.isSecured = false,
  });

  final LoginController controller;
  final String label;
  final String hintText;
  final TextEditingController textFieldController;
  final String? Function(String?)? validator;
  final bool isSecured;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: label,
            size: 14,
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: TextFormField(
              obscureText: isSecured,
              style: headingStyle4.copyWith(color: Colors.black),
              keyboardType: TextInputType.number,
              controller: textFieldController,
              validator: validator,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(20),
                errorStyle: headingStyle7,
                fillColor: Colors.white,
                filled: true,
                hintText: hintText,
                hintStyle: headingStyle6,
                focusedErrorBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.border, width: 2),
                    borderRadius: BorderRadius.circular(15)),
                disabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.border, width: 2),
                    borderRadius: BorderRadius.circular(15)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.border, width: 2),
                    borderRadius: BorderRadius.circular(15)),
                errorBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.border, width: 2),
                    borderRadius: BorderRadius.circular(15)),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.border, width: 2),
                    borderRadius: BorderRadius.circular(15)),
                border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.border, width: 2),
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
