import 'package:student/api/api.dart';
import 'package:student/models/activity.dart';
import 'package:student/services/get_profile.dart';

class GetActivities {
/*   String? sectionId; */
  Future<List<Activity>> getActivities({
    required int subjectId,
    required String type,
  }) async {
    var baseUrl =
        'https://eschool.nawagrow.com/api/student/subject/$subjectId/activity';
    var data = await Api().get(url: "$baseUrl/$type");

    List<Activity> activity = [];
    (data["data"]).forEach((element) {
      activity.add(Activity.fromJson(element));
    });
    return activity;
  }
}
