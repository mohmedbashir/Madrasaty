import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:student/utils/helpers/helpers.dart';

import '../prefs/student_preferences_controller.dart';

class Api {
  Future<dynamic> get({required String url}) async {
    http.Response response = await http.get(Uri.parse(url), headers: {
      HttpHeaders.authorizationHeader: StudentPreferencesController().token
    });
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      Helper.snackBar(
          title: '', content: 'فشلت عملية جلب البيانات هناك خطأ ما');
    }
  }

  Future<dynamic> post({required String url, dynamic body}) async {
    http.Response response = await http.post(Uri.parse(url),
        body: body,
        headers: {
          HttpHeaders.authorizationHeader: StudentPreferencesController().token
        });
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      Helper.snackBar(
          title: '', content: 'فشلت عملية إرسال البيانات هناك خطأ ما');
    }
  }

  Future<dynamic> put({required String url, dynamic body}) async {
    http.Response response = await http.put(Uri.parse(url),
        body: body,
        headers: {
          HttpHeaders.authorizationHeader: StudentPreferencesController().token
        });
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      Helper.snackBar(
          title: '', content: 'فشلت عملية تعديل البيانات هناك خطأ ما');
    }
  }

  Future<dynamic> delete({required String url, dynamic body}) async {
    http.Response response = await http.delete(Uri.parse(url),
        body: body,
        headers: {
          HttpHeaders.authorizationHeader: StudentPreferencesController().token
        });
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      Helper.snackBar(
          title: '', content: 'فشلت عملية حذف البيانات هناك خطأ ما');
    }
  }
}
