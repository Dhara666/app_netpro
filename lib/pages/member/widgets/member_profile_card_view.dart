import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_label_text.dart';
import 'package:net_pro_fan/constant/app_list.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class MemberProfileCardView extends StatelessWidget {
  const MemberProfileCardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (BuildContext context, ThemeProvider themeProvider, _) {
        return Column(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: ColorConstant.appDecoration(themeProvider.isDarkMode),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTitleText(title: AppList.profileList[0].name!, height: 2),
                  AppTitleText(title: AppList.profileList[0].email!, isSubTitle: true),
                  AppTitleText(title: S.of(context).organizationMember, height: 2),
                  AppTitleText(title: AppList.profileList[0].organization!, isSubTitle: true),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: ColorConstant.appDecoration(themeProvider.isDarkMode),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTitleText(title: S.of(context).totalScore, height: 2),
                  AppTitleText(title: AppList.profileList[0].totalScore!.toString(), isSubTitle: true),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
