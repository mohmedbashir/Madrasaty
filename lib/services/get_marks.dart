import 'package:student/api/api.dart';
import 'package:student/api/api_settings.dart';
import 'package:student/models/mark.dart';

class GetMarks {
  Future<List<Mark>> getMarks({required int subjectId}) async {
    const baseUrl = 'https://eschool.nawagrow.com/api/student/subject/';
    var data = await Api().get(url: "$baseUrl$subjectId/marks");

    List<Mark> Marks = [];
    (data["data"]["subject_marks"]).forEach((element) {
      Marks.add(Mark.fromjson(element));
    });
    return Marks;
  }
}
