import 'package:flutter/material.dart';
import 'package:net_pro_fan/pages/convenor/add_activity/seleted_activity_type/selected_activity_type_page.dart';
import 'package:net_pro_fan/providers/disposable_provider.dart';

class AddActivityProvider extends DisposableProvider {
  String? selectActivityType;

  List<String> activityType = [
    'CONTENT CREATION',
    'TRAINING & CAPACITY BUILDING ',
    'MASS DESSIMINATION',
    'OUTREACH ACTIVITY'
  ];

  void activityTypeOnChanged(BuildContext context ,String? request) {
    selectActivityType = request;
    Navigator.push(context, MaterialPageRoute(builder: (context) => const SelectedActivityTpePage(),));
    notifyListeners();
  }

  @override
  void disposeAllValues() {
    disposeValues();
  }

  @override
  void disposeValues() {
    selectActivityType = null;
  }
}
