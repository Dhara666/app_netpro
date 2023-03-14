import 'package:flutter/material.dart';
import 'package:net_pro_fan/pages/convenor/add_activity/add_activity_page.dart';
import 'package:net_pro_fan/pages/convenor/add_member/add_member_page.dart';
import 'package:net_pro_fan/pages/convenor/chapter_details/chapter_details_page.dart';
import 'package:net_pro_fan/pages/convenor/chapter_score/chapter_score_page.dart';
import 'package:net_pro_fan/pages/convenor/pending_request/pending_request_page.dart';
import 'package:net_pro_fan/providers/disposable_provider.dart';

class ConvenorProvider extends DisposableProvider {
  int pageIndex = 0;
  final pages = [
    const PendingRequestPage(),
    const ChapterScorePage(),
    const ChapterDetailsPage()
  ];

  void goToConvenorPagesTab(int index) {
    pageIndex = index;
    notifyListeners();
  }

  void gotoAddMemberPage(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AddMemberPage(),
        ));
  }

  void gotoAddActivityPage(context) {
    DisposeAllProviders.disposeConvenorAddActivityProvider(context);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AddActivityPage(),
        ));
  }

  @override
  void disposeAllValues() {
    disposeValues();
    // TODO: implement disposeAllValues
  }

  @override
  void disposeValues() {
    pageIndex = 0;
    // TODO: implement disposeValues
  }
}
