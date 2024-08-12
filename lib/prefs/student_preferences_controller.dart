import 'package:shared_preferences/shared_preferences.dart';
import 'package:student/models/login_model.dart';

class StudentPreferencesController {
  static final instance = StudentPreferencesController._();
  late SharedPreferences sharedPreferences;
  factory StudentPreferencesController() {
    return instance;
  }
  StudentPreferencesController._();
  Future<void> initSharePrefs() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveStudent({required StudentLogin studentLogin}) async {
    sharedPreferences.setBool('logged_in', true);
    sharedPreferences.setString(
        'accessToken', "Bearer ${studentLogin.accessToken}");
    sharedPreferences.setString('email', studentLogin.student.email);
    sharedPreferences.setString('name', studentLogin.student.name);
    sharedPreferences.setString('userName', studentLogin.student.name);
    sharedPreferences.setInt('userName', studentLogin.student.id);
  }

  bool get loggedIn => sharedPreferences.getBool('logged_in') ?? false;
  String get token => sharedPreferences.getString('accessToken') ?? "";
  Future<bool> logout() async {
    return await sharedPreferences.clear();
  }
}
