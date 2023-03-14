import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:net_pro_fan/pages/about_us/about_us_page.dart';
import 'package:net_pro_fan/pages/association/association_page.dart';
import 'package:net_pro_fan/pages/chapter_activity/chapter_activity_page.dart';
import 'package:net_pro_fan/pages/contact_us/contact_us_page.dart';
import 'package:net_pro_fan/pages/convenor/convenor_page.dart';
import 'package:net_pro_fan/pages/events/events_page.dart';
import 'package:net_pro_fan/pages/home/home_page.dart';
import 'package:net_pro_fan/pages/login/login_page.dart';
import 'package:net_pro_fan/pages/member/member_page.dart';
import 'package:net_pro_fan/pages/public_members/public_members_page.dart';
import 'package:net_pro_fan/pages/register/register_page.dart';
import 'package:net_pro_fan/app/widget/app_dialog.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/pages/resources/resources_page.dart';
import 'package:net_pro_fan/providers/disposable_provider.dart';
import 'package:net_pro_fan/services/db_helper.dart';
import 'package:net_pro_fan/app/utills/app_logs.dart';

class DashBoardProvider extends ChangeNotifier {
  int selectedIndex = 0;
  final AdvancedDrawerController advancedDrawerController = AdvancedDrawerController();
  List<Widget> dashboardList = <Widget>[
    const HomePage(),
    const AboutUsPage(),
    const PublicMembersPage(),
    const ChapterActivityPage(),
    const ResourcesPage(),
    const EventsPage(),
    const LoginPage(),
    const AssociationPage(),
    const ContactUsPage(),
    const RegisterPage(),
    const ConvenorPage(),
    const MembersPage(),
  ];

  Future<bool> onWillPop(context) async {
    return (await showDialog(
          context: context,
          barrierDismissible: true,
          builder: (_) => AppCustomAlertDialog(
              message: S.of(context).areYouSureYouWantToExit),
        )) ??
        false;
  }

  // TODO: integrate API for here
  Future<void> uploadDataToServer() async {
    // Convenor member
    List<Map<String, dynamic>> getConvenorMemberDataFromDatabase =
        await DBHelper.instance.getConvenorMemberTable();
    for (var element in getConvenorMemberDataFromDatabase) {
      if (element[DBHelper.cAddMemberTableStatus] ==
          ServerDataStatus.initial.name) {
        logs('Convenor member element --> $element');
        await DBHelper.instance.updateConvenorMemberTable(
            element[DBHelper.cAddMemberId], ServerDataStatus.uploaded.name);
        logs('${element[DBHelper.cAddMemberId]} uploaded successfully');
      }
    }
    // Convenor activity
    List<Map<String, dynamic>> getConvenorActivityDataFromDatabase =
        await DBHelper.instance.getConvenorActivityTable();
    for (var element in getConvenorActivityDataFromDatabase) {
      if (element[DBHelper.cAddActivityTableStatus] ==
          ServerDataStatus.initial.name) {
        logs('Convenor activity element --> $element');
        await DBHelper.instance.updateConvenorActivityTable(
            element[DBHelper.cAddActivityId], ServerDataStatus.uploaded.name);
        logs('${element[DBHelper.cAddActivityId]} uploaded successfully');
      }
    }
    // Member activity
    List<Map<String, dynamic>> getMemberActivityDataFromDatabase =
        await DBHelper.instance.getMemberActivityTable();
    for (var element in getMemberActivityDataFromDatabase) {
      if (element[DBHelper.mAddActivityTableStatus] ==
          ServerDataStatus.initial.name) {
        logs('Convenor activity element --> $element');
        await DBHelper.instance.updateMemberActivityTable(
            element[DBHelper.mAddActivityId], ServerDataStatus.uploaded.name);
        logs('${element[DBHelper.mAddActivityId]} uploaded successfully');
      }
    }
    // Association Chapter
    List<Map<String, dynamic>> getAssociationChapterDataFromDatabase =
        await DBHelper.instance.getAssociationChapterTable();
    for (var element in getAssociationChapterDataFromDatabase) {
      if (element[DBHelper.aAddChapterTableStatus] ==
          ServerDataStatus.initial.name) {
        logs('Association Chapter element --> $element');
        await DBHelper.instance.updateAssociationChapterTable(
            element[DBHelper.aAddChapterId], ServerDataStatus.uploaded.name);
        logs('${element[DBHelper.aAddChapterId]} uploaded successfully');
      }
    }
  }

  void goToRegister() {
    selectedIndex = 9;
    notifyListeners();
  }

  void goToConvenorPage() {
    selectedIndex = 10;
    notifyListeners();
  }

  void goToMemberPage(context) {
    selectedIndex = 11;
    DisposeAllProviders.disposeMemberAddActivityProvider(context);
    notifyListeners();
  }

  void goToPublicMembersPage() {
    drawerNavigator(2);
    notifyListeners();
  }

  void goToAboutUsPage() {
    drawerNavigator(1);
    notifyListeners();
  }

  void drawerNavigator(int index) {
    switch (index) {
      case 0:
        selectedIndex = 0;
        break;
      case 1:
        selectedIndex = 1;
        break;
      case 2:
        selectedIndex = 2;
        break;
      case 3:
        selectedIndex = 3;
        break;
      case 4:
        selectedIndex = 4;
        break;
      case 5:
        selectedIndex = 5;
        break;
      case 6:
        selectedIndex = 6;
        break;
      case 7:
        selectedIndex = 7;
        break;
      case 8:
        selectedIndex = 8;
        break;
      case 9:
        selectedIndex = 6;
        break;
    }
    notifyListeners();
  }
}
