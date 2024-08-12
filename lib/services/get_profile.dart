import 'package:student/api/api.dart';
import 'package:student/api/api_settings.dart';
import 'package:student/models/profile.dart';

class GetProfile {
  Future<Profile> getProfile() async {
    var data = await Api().get(url: ApiSettings.apiProfile);
    return Profile.fromJson(data);
  }
}
