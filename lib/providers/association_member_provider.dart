import 'dart:io';

import 'package:net_pro_fan/app/utills/app_logs.dart';
import 'package:net_pro_fan/model/association_member_model.dart';
import 'package:net_pro_fan/pages/association/association_member/association_add_member/association_add_member_page.dart';
import 'package:net_pro_fan/pages/association/association_member/association_view_member/association_view_member_page.dart';
import 'package:net_pro_fan/providers/disposable_provider.dart';
import 'package:net_pro_fan/services/rest_service.dart';

class AssociationMemberProvider extends DisposableProvider {
  int pageIndex = 0;
  bool isLoading = true;
  List<AssoiciationMemberModel> viewMembersModel = <AssoiciationMemberModel>[];

  final pages = [
    const AssociationAddMemberPage(),
    const AssociationViewMemberPage(),
  ];

  void goToAssociationMemberPageTab(int index) {
    pageIndex = index;
    notifyListeners();
  }

  Future<void> getViewMembers(context) async {
    try {
      String? getViewMembers = await RestServices.getRestCall(context, endpoint: RestConstants.associationViewMemberEndPoint);
      if (getViewMembers != null && getViewMembers.isNotEmpty) {
        logs('getViewMembers -->>$getViewMembers');
        List<AssoiciationMemberModel> assoiciationMemberModel = assoiciationMemberModelFromJson(getViewMembers);
        if (assoiciationMemberModel.isNotEmpty) {
          viewMembersModel = assoiciationMemberModel;
        }
      }
    } on SocketException catch (e) {
      logs('Catch exception getMyChapters -->> ${e.message}');
    }
    isLoading = false;
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
