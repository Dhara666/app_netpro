import 'package:flutter/cupertino.dart';
import 'package:net_pro_fan/pages/about_us/about_page.dart';
import 'package:net_pro_fan/pages/about_us/faq_page.dart';
import 'package:net_pro_fan/pages/about_us/objective_page.dart';
import 'package:net_pro_fan/pages/about_us/pledges_page.dart';
import 'package:net_pro_fan/pages/about_us/rewards_page.dart';
import 'package:net_pro_fan/pages/about_us/structure_page.dart';
import 'package:net_pro_fan/pages/about_us/themes_page.dart';
import 'package:net_pro_fan/pages/about_us/why_net_pro_fan_page.dart';

class AboutUsProvider extends ChangeNotifier {
  int pageIndex = 0;
  final pages = [
    const AboutPage(),
    const WhyNetProFanPage(),
    const ObjectivePage(),
    const ThemesPage(),
    const RewardsPage(),
    const PledgesPage(),
    const StructurePage(),
    const FAQPage(),
  ];

  void goToAboutUsPages(index) {
    pageIndex = index;
    notifyListeners();
  }
}
