import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_text.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/generated/l10n.dart';

class HomeHeaderView extends StatelessWidget {
  const HomeHeaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12, left: 12, top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: S.of(context).netProFan,
            textStyle: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: ColorConstant.appWhite),
          ),
          const SizedBox(
            height: 20,
          ),
          AppText(
            text: S
                .of(context)
                .networkOfProfessionalsOfFoodAndNutrition
                .toUpperCase(),
            textStyle: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: ColorConstant.appWhite),
          ),
        ],
      ),
    );
  }
}
