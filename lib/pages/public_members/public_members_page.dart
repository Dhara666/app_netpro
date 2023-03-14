import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_bottom_navigation_bar.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/model/bottom_navigation_model.dart';
import 'package:net_pro_fan/providers/public_members_provider.dart';
import 'package:provider/provider.dart';

class PublicMembersPage extends StatelessWidget {
  const PublicMembersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PublicMemberProvider>(
      builder: (BuildContext context, PublicMemberProvider publicMemberProvider, _) {
        return Scaffold(
          body: publicMemberProvider.pages[publicMemberProvider.pageIndex],
          bottomNavigationBar: AppBottomNavigationBar(
            selectedIndex: publicMemberProvider.pageIndex,
            bottomNavigationList: [
              BottomNavigationModel(
                title: S.of(context).steeringCommittee,
                onPressed: ()=> publicMemberProvider.goToPublicMemberPagesTab(0),
              ),
              BottomNavigationModel(
                title: S.of(context).netProFanChapters,
                onPressed: ()=> publicMemberProvider.goToPublicMemberPagesTab(1),
              ),
              BottomNavigationModel(
                title: S.of(context).topPerformers,
                onPressed: ()=> publicMemberProvider.goToPublicMemberPagesTab(2),
              ),
            ],
          ),
        );
      },
    );
  }
}
