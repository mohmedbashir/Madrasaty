import 'package:get/get.dart';

class NotificationsController extends GetxController {
  bool _notificationsSwitchValue = true;
  bool get notificationsSwitchValue => _notificationsSwitchValue;

  void changeNotificationsSwitchValue(bool value) {
    _notificationsSwitchValue = value;
    update();
  }
}
