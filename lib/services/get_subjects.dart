import 'dart:convert';

import 'package:student/api/api.dart';
import 'package:student/api/api_settings.dart';
import 'package:student/models/subject.dart';

class GetSubjects {
  Future<List<Subject>> getSubjects() async {
    var data = await Api().get(url: ApiSettings.apiHome);
    // Map<String, dynamic> jsonData = json.decode(data);
    List<Subject> subjects = [];
    (data["data"]["subjects"] as List).forEach((element) {
      subjects.add(Subject.fromjson(element));
    });
    return subjects;
  }
}
