import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_label_text.dart';
import 'package:net_pro_fan/app/widget/app_text.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/model/top_chapters_model.dart';
import 'package:net_pro_fan/model/top_members_model.dart';
import 'package:net_pro_fan/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class TopPerformersCardView extends StatelessWidget {
  final bool isChapter;
  final TopMembersModel? topMembersModelItem;
  final TopChaptersModel? topChaptersModelItem;

  const TopPerformersCardView({Key? key, this.topMembersModelItem, this.isChapter = false, this.topChaptersModelItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (BuildContext context, ThemeProvider themeProvider, _) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: ColorConstant.appDecoration(themeProvider.isDarkMode),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (!isChapter) AppText(text: topMembersModelItem!.nameOfMember!.toUpperCase(), textStyle: Theme.of(context).textTheme.subtitle1),
                  AppText(
                    text: !isChapter ? topMembersModelItem!.slNo.toString() : topChaptersModelItem!.slNo.toString(),
                    textStyle: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              AppTitleText(title: S.of(context).cityLabel,height: 2),
              AppTitleText(title: !isChapter ? topMembersModelItem!.city.toString() : topChaptersModelItem!.city.toString(),isSubTitle: true,),
              AppTitleText(title: S.of(context).score,height: 2),
              AppTitleText(title: !isChapter ? topMembersModelItem!.score.toString() : topChaptersModelItem!.score.toString(),isSubTitle: true,height: 5),
            ],
          ),
        );
      },
    );
  }
}
