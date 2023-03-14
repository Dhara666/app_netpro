import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/utills/app_logs.dart';
import 'package:url_launcher/url_launcher.dart';

class FssaiResourcesProvider extends ChangeNotifier {
  void onExpansionChanged(bool newState) {
    if (newState) {
      notifyListeners();
    } else {
      notifyListeners();
    }
  }

  void onBooksLink(String link) {
    link.urlLauncher(mode: LaunchMode.externalApplication);
  }
}
