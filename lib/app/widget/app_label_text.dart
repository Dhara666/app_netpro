import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_text.dart';
import 'package:net_pro_fan/constant/color_constant.dart';

class AppLabelText extends StatelessWidget {
  final String title;

  const AppLabelText({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, top: 20, bottom: 8),
      child: AppText(text: title, textStyle: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 14)),
    );
  }
}

class AppTitleText extends StatelessWidget {
  final String title;
  final bool isSubTitle;
  final bool isRed;
  final double? height;

  const AppTitleText({Key? key, required this.title, this.isSubTitle = false, this.height = 8, this.isRed = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: height!),
      child: AppText(
          text: title,
          textStyle: isRed
              ? const TextStyle(
                  color: ColorConstant.appRed,
                  fontWeight: FontWeight.w600,
                  fontSize: 9,
                )
              : !isSubTitle
                  ? Theme.of(context).textTheme.subtitle1
                  : Theme.of(context).textTheme.subtitle2),
    );
  }
}
