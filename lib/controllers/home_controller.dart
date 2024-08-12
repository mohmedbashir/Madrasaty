import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/models/profile.dart';
import 'package:student/models/subject.dart';
import 'package:student/services/get_profile.dart';
import 'package:student/services/get_subjects.dart';
import 'package:student/view/screens/home/account_page.dart';
import 'package:student/view/screens/home/home.dart';
import 'package:student/view/screens/home/messages_page.dart';
import 'package:student/view/screens/home/notifications_page.dart';
import 'package:student/view/screens/home/subjects_page.dart';

class HomeController extends GetxController {
  int _bnbIndex = 0;
  int get bnbIndex => _bnbIndex;

  selectIndex(int index) {
    _bnbIndex = index;
    update();
  }

  Widget get body => _appPages[_bnbIndex];
  List<Widget> _appPages = [
    SubjectsPage(),
    NotificationsPage(),
    MessagesPage(),
    AccountPage()
  ];
  Future getSubjects() async {
    subjects = await GetSubjects().getSubjects();
  }

  Future getProflie() async {
    userProfile = await GetProfile().getProfile();
  }

  late Profile userProfile;
  List<Subject> subjects = [];
}
