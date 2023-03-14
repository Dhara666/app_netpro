import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_button.dart';
import 'package:net_pro_fan/app/widget/app_image_assets.dart';
import 'package:net_pro_fan/app/widget/app_text.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class PendingRequestListTile extends StatelessWidget {
  final String? leadingImage;
  final String? title;
  final VoidCallback? onPressed;

  const PendingRequestListTile(
      {Key? key,
      @required this.leadingImage,
      @required this.title,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (BuildContext context, ThemeProvider themeProvider, _) {
        return Container(
          margin: const EdgeInsets.all(8.0),
          decoration: ColorConstant.appDecoration(themeProvider.isDarkMode),
          child: ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            minVerticalPadding: 0,
            horizontalTitleGap: 5,
            leading: Container(
              height: 20,
              width: 20,
              margin: const EdgeInsets.only(left: 8),
              child: AppImageAsset(
                image: leadingImage,
                color: themeProvider.isDarkMode
                    ? ColorConstant.appWhite
                    : ColorConstant.appBlack.withOpacity(0.7),
              ),
            ),
            title: AppText(
              text: title!,
              textStyle: Theme.of(context).textTheme.subtitle1,
            ),
            trailing: AppElevatedButton(
              onPressed: onPressed,
              text: S.of(context).proceed,
              height: 25,
              width: 80,
              fontSize: 12,
              buttonColor: ColorConstant.appBlue,
              margin: const EdgeInsets.only(right: 8),
              borderRadius: 3,
            ),
          ),
        );
      },
    );
  }
}
