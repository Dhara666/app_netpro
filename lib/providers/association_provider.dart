import 'package:flutter/material.dart';
import 'package:net_pro_fan/pages/association/association_chapter/association_chapter_page.dart';
import 'package:net_pro_fan/pages/association/association_member/association_member_page.dart';
import 'package:net_pro_fan/providers/disposable_provider.dart';

class AssociationProvider extends DisposableProvider {
  int pageIndex = 0;
  final pages = [
   const AssociationChapterPage(),
   const AssociationMemberPage(),
  ];

  void goToAssociationPageTab(BuildContext context,int index) {
    pageIndex = index;
    notifyListeners();
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
