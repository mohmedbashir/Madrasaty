import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Helper {
  static void snackBar({required String title, required String content}) {
     Get.snackbar('', '',
          duration: const Duration(seconds: 4),
          titleText:  Text(
            title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          messageText:  Text(content,
              style: const TextStyle(fontSize: 18)),
          snackPosition: SnackPosition.BOTTOM);
  }
}
