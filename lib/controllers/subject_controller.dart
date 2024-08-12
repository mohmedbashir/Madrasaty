import 'package:get/get.dart';

class SubjectController extends GetxController {
  String _selectedSection = 'subject';
  String get selectedSection => _selectedSection;


  switchSelectedSection(String section) {
    if (section == 'subject') {
      _selectedSection = 'subject';
    } else {
      _selectedSection = 'grades';
    }
    update();
  }
}
