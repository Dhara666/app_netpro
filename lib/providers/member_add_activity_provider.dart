import 'package:flutter/material.dart';
import 'package:net_pro_fan/pages/member/member_add_activity/member_selected_activity_type/member_selected_activity_type_page.dart';
import 'package:net_pro_fan/providers/disposable_provider.dart';

class MemberAddActivityProvider extends DisposableProvider {
  String? selectActivityType;

  List<String> activityType = [
    'CONTENT CREATION',
    'TRAINING & CAPACITY BUILDING ',
    'MASS DESSIMINATION',
    'OUTREACH ACTIVITY'
  ];

  void activityTypeOnChanged(BuildContext context, String? request) {
    selectActivityType = request;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MemberSelectedActivityTpePage(),
        ));
    notifyListeners();
  }

  @override
  void disposeAllValues() {
    disposeValues();
    // TODO: implement disposeAllValues
  }

  @override
  void disposeValues() {
    selectActivityType = null;
    // TODO: implement disposeValues
  }
}
