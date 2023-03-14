import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/utills/app_logs.dart';
import 'package:net_pro_fan/app/widget/app_text.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePageListTile extends StatelessWidget {
  final String? title;
  final IconData? leadingIcon;
  final String? subTitle;
  final String? link;

  const HomePageListTile(
      {Key? key,
      required this.title,
      required this.leadingIcon,
      required this.subTitle,
      required this.link})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => link!.urlLauncher(mode: LaunchMode.externalApplication),
      title: AppText(
        text: title,
        textStyle: Theme.of(context).textTheme.headline5!.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: ColorConstant.appWhite),
      ),
      horizontalTitleGap: -10,
      dense: true,
      contentPadding: EdgeInsets.zero,
      minVerticalPadding: 0,
      leading: SizedBox(
        height: 40,
        width: 10,
        child: Icon(leadingIcon, color: ColorConstant.appRed),
      ),
      subtitle: AppText(
        text: subTitle,
        textStyle: Theme.of(context)
            .textTheme
            .headline5!
            .copyWith(fontSize: 12, color: ColorConstant.appWhite),
      ),
    );
  }
}
