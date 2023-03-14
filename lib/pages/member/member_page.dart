import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_bottom_navigation_bar.dart';
import 'package:net_pro_fan/app/widget/app_header_view.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/model/bottom_navigation_model.dart';
import 'package:net_pro_fan/providers/member_provider.dart';
import 'package:provider/provider.dart';

class MembersPage extends StatelessWidget {
  const MembersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MembersProvider>(
      builder: (BuildContext context, MembersProvider membersProvider, _) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50.0),
              child: AppHeaderView(title: S.of(context).memberDashBoard),
            ),
          ),
          body: membersProvider.pages[membersProvider.pageIndex],
          bottomNavigationBar: AppBottomNavigationBar(
            selectedIndex: membersProvider.pageIndex,
            bottomNavigationList: [
              BottomNavigationModel(
                title: S.of(context).profile.toUpperCase(),
                onPressed: ()=>membersProvider.goToMemberPagesTab(0),
              ),
              BottomNavigationModel(
                title: S.of(context).addActivity.toUpperCase(),
                onPressed: ()=>membersProvider.goToMemberPagesTab(1),
              ),
              BottomNavigationModel(
                title: S.of(context).activityPerformed.toUpperCase(),
                onPressed: ()=>membersProvider.goToMemberPagesTab(2),
              ),
            ],
          ),
        );
      },
    );
  }
}
