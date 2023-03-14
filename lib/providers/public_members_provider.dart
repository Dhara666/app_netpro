import 'package:flutter/cupertino.dart';
import 'package:net_pro_fan/pages/public_members/net_pro_fan_chapters/net_pro_fan_chapters_page.dart';
import 'package:net_pro_fan/pages/public_members/steering_committee/steering_committee_page.dart';
import 'package:net_pro_fan/pages/public_members/top_performers/top_performers_page.dart';

class PublicMemberProvider extends ChangeNotifier {
  int pageIndex = 0;
  final pages = [
    const SteeringCommitteePage(),
    const NetProFanChaptersPage(),
    const TopPerformersPage()
  ];

  void goToPublicMemberPagesTab(int index) {
    pageIndex = index;
    notifyListeners();
  }
}
