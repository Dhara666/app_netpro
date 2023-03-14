import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/utills/app_logs.dart';
import 'package:url_launcher/url_launcher.dart';

class NetProFanResourcesProvider extends ChangeNotifier {
  void linkChanged(bool newState, String link) {
    if (newState) {
      link.urlLauncher(mode: LaunchMode.externalApplication);
      notifyListeners();
    } else {
      notifyListeners();
    }
  }
}