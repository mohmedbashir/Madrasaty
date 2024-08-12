import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 80),
                Image.asset(
                  AssetsImage.absence,
                  height: 250,
                  width: 250,
                ),
                const SizedBox(height: 25),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'أدخل الكود المرسل إليك',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryClr),
                  ),
                ),
                const SizedBox(height: 25),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OTTPFeild(),
                    OTTPFeild(),
                    OTTPFeild(),
                    Text('-'),
                    OTTPFeild(),
                    OTTPFeild(),
                    OTTPFeild(),
                  ],
                ),
                const SizedBox(height: 30),
                const Text(
                  '02:00',
                ),
                const SizedBox(height: 15),
                InkWell(
                    onTap: () {},
                    child: const Text(
                      'إعادة إرسال الكود',
                      style: TextStyle(
                          color: AppColors.primaryClr,
                          fontWeight: FontWeight.w600),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OTTPFeild extends StatelessWidget {
  const OTTPFeild({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        autofocus: true,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 28, color: AppColors.primaryClr),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(width: 1, color: AppColors.primaryClr),
          ),
        ),
      ),
    );
  }
}
