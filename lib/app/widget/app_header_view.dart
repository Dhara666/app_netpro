import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_text.dart';
import 'package:net_pro_fan/constant/color_constant.dart';

class AppHeaderView extends StatelessWidget {
  final String? title;

  const AppHeaderView({Key? key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: ColorConstant.appBlue,
      alignment: Alignment.center,
      child: AppText(
        text: title,
        textStyle: Theme.of(context).textTheme.headline2!.copyWith(
              color: ColorConstant.appWhite,
              fontSize: 12,
            ),
      ),
    );
  }
}
