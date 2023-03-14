import 'package:net_pro_fan/pages/member/member_activity_performed/member_activity_performed_page.dart';
import 'package:net_pro_fan/pages/member/member_add_activity/member_add_activity_page.dart';
import 'package:net_pro_fan/pages/member/member_profile/member_profile_page.dart';
import 'package:net_pro_fan/providers/disposable_provider.dart';

class MembersProvider extends DisposableProvider {
  int pageIndex = 0;
  final pages = [
    const MemberProfilePage(),
    const MemberAddActivityPage(),
    const MemberActivityPerformedPage()
  ];

  void goToMemberPagesTab(int index) {
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
