import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:student/view/screens/auth/otp_screen.dart';

import '../../../utils/constants.dart';

class ForgetScreen extends StatelessWidget {
  ForgetScreen({super.key});
  final mobileNumberController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
          iconSize: 30,
          color: AppColors.primaryClr,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Image.asset(
                AssetsImage.absence,
                height: 250,
                width: 250,
              ),
              const Text(
                'نسيت كلمة المرور',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryClr),
              ),
              const Text(
                'رقم الهاتف',
                style: TextStyle(fontSize: 20, color: AppColors.primaryClr),
              ),
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d{0,9}$')),
                ],
                keyboardType: TextInputType.number,
                controller: mobileNumberController,
                validator: (value) {
                  if (value!.length != 8 && value.isEmpty) {
                    return 'هناك خطأ في رقم الهاتف';
                  }
                  return '';
                },
                decoration: InputDecoration(
                    fillColor: Colors.white,
          filled: true,
                  contentPadding: const EdgeInsets.only(right: 230, left: 30),
                  suffixText: '+970',
                  hintText: '00000000',
                  suffixStyle: const TextStyle(fontWeight: FontWeight.w500),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColors.primaryClr),
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(const OTPScreen());
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryClr),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'ارسال',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
