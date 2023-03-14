import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_label_text.dart';
import 'package:net_pro_fan/app/widget/app_text.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/model/member_activity_performed_model.dart';
import 'package:net_pro_fan/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class MemberActivityPerformedCardView extends StatelessWidget {
  final MemberActivityPerformedModel? memberActivityPerformedModel;

  const MemberActivityPerformedCardView({Key? key, this.memberActivityPerformedModel}) : super(key: key);

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
                  AppTitleText(title: memberActivityPerformedModel!.activityName!, height: 2),
                  AppText(text: memberActivityPerformedModel!.slNo.toString(), textStyle: Theme.of(context).textTheme.headline2),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              AppTitleText(title: S.of(context).activityCategory, height: 2),
              AppTitleText(title: memberActivityPerformedModel!.activityCategory!, isSubTitle: true),
              AppTitleText(title: S.of(context).activityNameMember, height: 2),
              AppTitleText(title: memberActivityPerformedModel!.activityName!, isSubTitle: true),
              AppTitleText(title: S.of(context).eventDate, height: 2),
              AppTitleText(title: memberActivityPerformedModel!.eventDate!, isSubTitle: true),
              AppTitleText(title: S.of(context).status, height: 2),
              AppTitleText(title: memberActivityPerformedModel!.status!, isSubTitle: true),
            ],
          ),
        );
      },
    );
  }
}
