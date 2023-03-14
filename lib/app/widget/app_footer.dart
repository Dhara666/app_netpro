import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_image_assets.dart';
import 'package:net_pro_fan/app/widget/app_text.dart';
import 'package:net_pro_fan/constant/app_asset.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/generated/l10n.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.only(top: 15),
      color: ColorConstant.appBlue,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              imageView(AppAsset.facebookIcon),
              const SizedBox(
                width: 15,
              ),
              imageView(AppAsset.twitterIcon),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          AppText(
              text: S.of(context).footerDescription,
              textAlign: TextAlign.center,
              textStyle: Theme.of(context)
                  .textTheme
                  .headline1!.copyWith(color: ColorConstant.appWhite)
          ),
        ],
      ),
    );
  }

  Container imageView(String? image) {
    return Container(
        height: 20,
        width: 20,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: ColorConstant.appWhite,
            borderRadius: BorderRadius.circular(4)),
        child: AppImageAsset(
            image: image,
            color: ColorConstant.appBlue,
            fit: BoxFit.cover));
  }
}
