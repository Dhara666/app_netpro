import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_image_assets.dart';
import 'package:net_pro_fan/constant/app_asset.dart';
import 'package:net_pro_fan/app/widget/app_button.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class AppAppBar extends PreferredSize {
  final bool isHome;
  final bool showDrawer;
  final double margin;
  final GestureTapCallback? onUserTap;
  final bool showUser;

  AppAppBar({
    Key? key,
    this.isHome = true,
    this.showDrawer = true,
    this.margin = 20,
    this.onUserTap,
    this.showUser = true,
    Widget? child,
    Size? preferredSize,
  }) : super(
          key: key,
          child: Container(),
          preferredSize: Size.fromHeight(AppBar(
                elevation: 0,
              ).preferredSize.height *
              1),
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<ThemeProvider>(
        builder: (BuildContext context, ThemeProvider themeProvider, _) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
                color: themeProvider.isDarkMode
                    ? ColorConstant.appDarkBlack
                    : ColorConstant.appWhite),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (isHome)
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                        margin: EdgeInsets.only(right: margin, left: 12),
                        child: Icon(Icons.arrow_back_ios,
                            color: themeProvider.isDarkMode
                                ? ColorConstant.appWhite
                                : ColorConstant.appBlack)),
                  ),
                if (showDrawer)
                  InkWell(
                    onTap: onUserTap,
                    child: Container(
                      margin: EdgeInsets.only(right: margin, left: 12),
                      child: Icon(Icons.menu,
                          color: themeProvider.isDarkMode
                              ? ColorConstant.appWhite
                              : ColorConstant.appBlack),
                    ),
                  ),
                if (isHome) const SizedBox(width: 16),
                const Spacer(),
                AppImageAsset(
                  image: themeProvider.isDarkMode
                      ? AppAsset.netProFanLogoDark
                      : AppAsset.netProFanLogo,
                  height: 40,
                  width: 90,
                ),
                const Spacer(),
                if (showUser)
                  Consumer<ThemeProvider>(
                    builder:
                        (BuildContext context, ThemeProvider themeProvider, _) {
                      return AppElevatedButton(
                        text: themeProvider.isDarkMode
                            ? 'Light Theme'
                            : 'Dark Theme',
                        width: 70,
                        fontSize: 9,
                        borderRadius: 3,
                        buttonColor: ColorConstant.appYellow,
                        margin: const EdgeInsets.only(right: 3),
                        onPressed: () => themeProvider.swapTheme(),
                      );
                    },
                  ),
                if (!showUser) const Spacer(),
              ],
            ),
          );
        },
      ),
    );
  }
}
