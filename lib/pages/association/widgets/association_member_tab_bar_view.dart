import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_bottom_navigation_bar.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/model/bottom_navigation_model.dart';
import 'package:net_pro_fan/providers/association_member_provider.dart';
import 'package:net_pro_fan/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class AssociationMemberTabBarView extends PreferredSize {
  AssociationMemberTabBarView({
    Key? key,
    Widget? child,
    Size? preferredSize,
  }) : super(
    key: key,
    child: Container(),
    preferredSize: const Size.fromHeight(50),
  );

  @override
  Widget build(BuildContext context) {
    return Consumer2<AssociationMemberProvider, ThemeProvider>(
      builder: (BuildContext context, associationMemberProvider,themeProvider, _) {
        return AppBar(
          toolbarHeight: 0,
          backgroundColor: themeProvider.isDarkMode ? ColorConstant.appDarkBlack : ColorConstant.appWhite,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: AppBottomNavigationBar(
              selectedIndex: associationMemberProvider.pageIndex,
              bottomNavigationList: [
                BottomNavigationModel(
                  title: S.of(context).addMember,
                  onPressed: () => associationMemberProvider.goToAssociationMemberPageTab(0),
                ),
                BottomNavigationModel(
                  title: S.of(context).viewMember,
                  onPressed: () => associationMemberProvider.goToAssociationMemberPageTab(1),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
