import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_custom_expansion_tile.dart';
import 'package:net_pro_fan/app/widget/app_footer.dart';
import 'package:net_pro_fan/app/widget/app_image_assets.dart';
import 'package:net_pro_fan/app/widget/app_text.dart';
import 'package:net_pro_fan/constant/app_asset.dart';
import 'package:net_pro_fan/constant/app_list.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/providers/about_us_provider.dart';
import 'package:net_pro_fan/providers/dashboard_provider.dart';
import 'package:net_pro_fan/providers/disposable_provider.dart';
import 'package:net_pro_fan/providers/public_members_provider.dart';
import 'package:net_pro_fan/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {

  const AppDrawer({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<DashBoardProvider, ThemeProvider>(
      builder: (BuildContext context, DashBoardProvider dashBoardProvider,
          ThemeProvider themeProvider, _) {
        return Drawer(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 55, bottom: 40),
                alignment: Alignment.center,
                child: AppImageAsset(
                  image: themeProvider.isDarkMode
                      ? AppAsset.netProFanLogoDark
                      : AppAsset.netProFanLogo,
                  height: 40,
                  width: 130,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: AppList.drawerList.length,
                  itemBuilder: (context, index) {
                    if (index == 1) {
                      return buildAboutUsView(
                          context, dashBoardProvider, themeProvider);
                    } else if (index == 2) {
                      return buildMemberView(
                          context, dashBoardProvider, themeProvider);
                    }
                    return buildDrawerOptions(
                        context, index, dashBoardProvider, themeProvider);
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 30,
                  bottom: 20,
                ),
                alignment: Alignment.center,
                child: AppImageAsset(
                  image: themeProvider.isDarkMode
                      ? AppAsset.fssaiLogoDark
                      : AppAsset.fssaiLogo,
                  height: 40,
                  width: 130,
                  fit: BoxFit.fill,
                ),
              ),
              const AppFooter(),
            ],
          ),
        );
      },
    );
  }

  InkWell buildDrawerOptions(
    BuildContext context,
    int index,
    DashBoardProvider dashBoardProvider,
    ThemeProvider themeProvider,
  ) {
    return InkWell(
      onTap: () {
        dashBoardProvider.drawerNavigator(index);
        dashBoardProvider.advancedDrawerController.hideDrawer();
        DisposeAllProviders.disposeAllDisposableProviders(context);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: ColorConstant.appTransparent,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: AppText(
              textStyle:
                  Theme.of(context).textTheme.headline2!.copyWith(fontSize: 15),
              text: AppList.drawerList[index],
            ),
          ),
          const Divider(
            indent: 10,
            endIndent: 10,
          ),
        ],
      ),
    );
  }

  Column buildMemberView(BuildContext context,
      DashBoardProvider dashBoardProvider, ThemeProvider themeProvider) {
    return Column(
      children: [
        AppCustomExpansionTile(
          title: 'Members',
          headerBackgroundColor: themeProvider.isDarkMode
              ? ColorConstant.appDarkBlack
              : ColorConstant.appWhite,
          iconColor: themeProvider.isDarkMode
              ? ColorConstant.appWhite
              : ColorConstant.appBlue,
          textStyle:
              Theme.of(context).textTheme.headline2!.copyWith(fontSize: 15),
          margin: EdgeInsets.zero,
          children: [
            Consumer<PublicMemberProvider>(
              builder:
                  (BuildContext context, PublicMemberProvider publicMemberProvider, _) {
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      dashBoardProvider.goToPublicMembersPage();
                      publicMemberProvider.goToPublicMemberPagesTab(index);
                      dashBoardProvider.advancedDrawerController.hideDrawer();
                      DisposeAllProviders.disposeAllDisposableProviders(context);
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: index == 0
                                ? S.of(context).steeringCommittee

                                : index == 1
                                    ? S.of(context).netProFanChapters
                                    : S.of(context).topPerformers,
                            textStyle: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(fontSize: 15),
                          ),
                          const SizedBox(height: 5),
                          if (index != 2) const Divider(),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
        const Divider(
          indent: 10,
          endIndent: 10,
        ),
      ],
    );
  }

  Column buildAboutUsView(BuildContext context,
      DashBoardProvider dashBoardProvider, ThemeProvider themeProvider) {
    return Column(
      children: [
        AppCustomExpansionTile(
          title: 'About Us',
          headerBackgroundColor: themeProvider.isDarkMode
              ? ColorConstant.appDarkBlack
              : ColorConstant.appWhite,
          iconColor: themeProvider.isDarkMode
              ? ColorConstant.appWhite
              : ColorConstant.appBlue,
          textStyle:
              Theme.of(context).textTheme.headline2!.copyWith(fontSize: 15),
          margin: EdgeInsets.zero,
          children: [
            Consumer<AboutUsProvider>(
              builder:
                  (BuildContext context, AboutUsProvider aboutUsProvider, _) {
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: AppList.aboutUsList.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      dashBoardProvider.goToAboutUsPage();
                      aboutUsProvider.goToAboutUsPages(index);
                      dashBoardProvider.advancedDrawerController.hideDrawer();
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: AppList.aboutUsList[index],
                            textStyle: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(fontSize: 15),
                          ),
                          const SizedBox(height: 5),
                          if (index != AppList.aboutUsList.length - 1)
                            const Divider(),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
        const Divider(
          indent: 10,
          endIndent: 10,
        ),
      ],
    );
  }
}
