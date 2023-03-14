import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_bottom_navigation_bar.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/model/bottom_navigation_model.dart';
import 'package:net_pro_fan/providers/association_chapter_provider.dart';
import 'package:net_pro_fan/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class AssociationChapterTabBarView extends PreferredSize {
  AssociationChapterTabBarView({
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
    return Consumer2<AssociationChapterProvider, ThemeProvider>(
      builder: (BuildContext context, associationChapterProvider,themeProvider, _) {
        return AppBar(
          toolbarHeight: 0,
          backgroundColor: themeProvider.isDarkMode ? ColorConstant.appDarkBlack : ColorConstant.appWhite,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: AppBottomNavigationBar(
              selectedIndex: associationChapterProvider.pageIndex,
              bottomNavigationList: [
                BottomNavigationModel(
                  title: S.of(context).myChapters,
                  onPressed: () => associationChapterProvider.goToAssociationChapterPageTab(0),
                ),
                BottomNavigationModel(
                  title: S.of(context).onGoingChapters,
                  onPressed: () => associationChapterProvider.goToAssociationChapterPageTab(1),
                ),
                BottomNavigationModel(
                  title: S.of(context).addChapter,
                  onPressed: () => associationChapterProvider.goToAssociationChapterPageTab(2),
                ),
                BottomNavigationModel(
                  title: S.of(context).allChapters,
                  onPressed: () => associationChapterProvider.goToAssociationChapterPageTab(3),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
