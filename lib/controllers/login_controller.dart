import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:student/api/api_settings.dart';
import 'package:student/controllers/home_controller.dart';
import 'package:student/models/login_model.dart';
import 'package:student/prefs/student_preferences_controller.dart';
import 'package:student/utils/helpers/helpers.dart';
import 'package:student/view/screens/auth/login.dart';
import 'package:student/view/screens/home/home.dart';

class LoginController extends GetxController {
  final idController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<bool> apiLogin({required String id, required String password}) async {
    var url = Uri.parse(ApiSettings.apiLogin);
    var response =
        await http.post(url, body: {'national_id': id, 'password': password});
    if (response.statusCode == 200) {
      try {
        var jsonRes = jsonDecode(response.body);

        StudentLogin studentLogin = StudentLogin.fromJson(jsonRes['data']);
        StudentPreferencesController().saveStudent(studentLogin: studentLogin);
        return true;
      } catch (e) {
        print(e);
      }
      return false;
    } else if (response.statusCode == 400) {
      Future.error('error');
    }

    return false;
  }

  Future<bool> apiLogout() async {
    var url = Uri.parse(ApiSettings.apiLogOut);
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: StudentPreferencesController().token
    });
    if (response.statusCode == 200 || response.statusCode == 401) {
      await StudentPreferencesController().logout();
      return true;
    }
    return false;
  }

  bool checkData() {
    if (idController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  bool loading = false;
  Future<void> login() async {
    loading = true;
    update();
    HomeController homeController = Get.put(HomeController());
    bool status = await apiLogin(
        id: idController.text, password: passwordController.text);
    loading = false;
    if (status) {
      await homeController.getSubjects();
      await homeController.getProflie();
      Get.offAll(() => const Home());
      idController.clear();
      passwordController.clear();
      loading = false;
      update();
    } else {
      loading = false;
      update();
      Helper.snackBar(
          title: 'خطأ',
          content: 'فشلت عملية تسجيل الدخول. يرجى المحاولة مرة أخرى');
    }
  }

  Future<void> logout() async {
    bool status = await apiLogout();
    if (status) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.showSnackbar(const GetSnackBar(
        messageText: Text('Logout Failed try again'),
        snackPosition: SnackPosition.BOTTOM,
      ));
    }
  }

  Future<void> preformLogin() async {
    if (checkData()) {
      await login();
    }
  }

  @override
  void onClose() {
    idController.clear();
    passwordController.clear();
    super.onClose();
  }
}
