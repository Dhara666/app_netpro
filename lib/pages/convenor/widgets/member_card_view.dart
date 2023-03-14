import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_button.dart';
import 'package:net_pro_fan/app/widget/app_label_text.dart';
import 'package:net_pro_fan/app/widget/app_text.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/model/member_model.dart';
import 'package:net_pro_fan/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class MemberCardView extends StatelessWidget {
  final bool isAction;
  final MemberModel? memberModel;

  const MemberCardView({Key? key, this.isAction = false, this.memberModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (BuildContext context, ThemeProvider themeProvider, _) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: ColorConstant.appDecoration(themeProvider.isDarkMode),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppTitleText(title: memberModel!.name!, height: 2),
                  AppText(
                    text: memberModel!.slNo.toString(),
                    textStyle: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
              AppTitleText(title: memberModel!.email!, isSubTitle: true),
              AppTitleText(title: S.of(context).organizations, height: 2),
              AppTitleText(title: memberModel!.organization!, isSubTitle: true),
              AppText(text: S.of(context).professionalAssociation, textStyle: Theme.of(context).textTheme.subtitle1),
              SizedBox(
                width: 230,
                child: AppTitleText(title: memberModel!.professionalAssociation!, isSubTitle: true,height: 0),
              ),
              if (isAction)
                Align(
                  alignment: Alignment.bottomRight,
                  child: AppElevatedButton(
                    onPressed: () {},
                    text: S.of(context).action,
                    height: 25,
                    width: 70,
                    fontSize: 12,
                    buttonColor: ColorConstant.appBlue,
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}
