import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_custom_expansion_tile.dart';
import 'package:net_pro_fan/app/widget/app_header_view.dart';
import 'package:net_pro_fan/app/widget/app_image_assets.dart';
import 'package:net_pro_fan/app/widget/app_text.dart';
import 'package:net_pro_fan/constant/app_asset.dart';
import 'package:net_pro_fan/constant/app_list.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/generated/l10n.dart';

class ThemesPage extends StatelessWidget {
  const ThemesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppHeaderView(title: S.of(context).themes.toUpperCase()),
        Expanded(
            child: ListView(
          children: [
            imageView(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
              child: AppText(
                text: S.of(context).themesInAction,
                textAlign: TextAlign.start,
                textStyle: Theme.of(context).textTheme.headline2!.copyWith(
                      fontSize: 14,
                    ),
              ),
            ),
            ListView.builder(
              itemCount: AppList.themeActionList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => AppCustomExpansionTile(
                headerBackgroundColor: ColorConstant.appYellow,
                title: '${index + 1}. ${AppList.themeActionList[index].title}',
                children: [
                  AppImageAsset(
                    height: 450,
                    width: double.infinity,
                    image: AppList.themeActionList[index].image,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            )
          ],
        )),
      ],
    );
  }

  AppImageAsset imageView() {
    return const AppImageAsset(
      height: 430,
      image: AppAsset.themesImage,
      fit: BoxFit.contain,
    );
  }
}
