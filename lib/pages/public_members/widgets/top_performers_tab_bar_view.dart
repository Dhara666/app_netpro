import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_bottom_navigation_bar.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/model/bottom_navigation_model.dart';
import 'package:net_pro_fan/providers/theme_provider.dart';
import 'package:net_pro_fan/providers/top_performers_provider.dart';
import 'package:provider/provider.dart';

class TopPerformersTabBarView extends PreferredSize {
  TopPerformersTabBarView({
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
    return Consumer2<TopPerFormersProvider, ThemeProvider>(
      builder: (BuildContext context,
          TopPerFormersProvider topPerFormersProvider,
          ThemeProvider themeProvider,
          _) {
        return AppBar(
          toolbarHeight: 0,
          backgroundColor: themeProvider.isDarkMode
              ? ColorConstant.appDarkBlack
              : ColorConstant.appWhite,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: AppBottomNavigationBar(
              selectedIndex: topPerFormersProvider.pageIndex,
              bottomNavigationList: [
                BottomNavigationModel(
                  title: S.of(context).top5Chapters,
                  onPressed: () =>
                      topPerFormersProvider.goToTopPerFormersPagesTab(0),
                ),
                BottomNavigationModel(
                  title: S.of(context).top10Members,
                  onPressed: () =>
                      topPerFormersProvider.goToTopPerFormersPagesTab(1),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
