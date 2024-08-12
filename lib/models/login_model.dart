import 'student.dart';

class StudentLogin {
  late String accessToken;
  late int expiresIn;
  late String tokenType;
  late Student student;

  StudentLogin(
      {required this.accessToken,
      required this.expiresIn,
      required this.tokenType,
      required this.student});

  StudentLogin.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    expiresIn = json['expires_in'];
    tokenType = json['token_type'];
    student = (json['auth'] != null ? Student.fromJson(json['auth']) : null)!;
  }
}
