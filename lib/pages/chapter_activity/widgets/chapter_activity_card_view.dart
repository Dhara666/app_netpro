import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_label_text.dart';
import 'package:net_pro_fan/app/widget/app_text.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/model/chapter_activity_model.dart';
import 'package:net_pro_fan/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ChapterActivityCardView extends StatelessWidget {
  final ChapterActivityModel? chapterActivityModel;

  const ChapterActivityCardView({Key? key, this.chapterActivityModel}) : super(key: key);

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
                  AppTitleText(title: chapterActivityModel!.personName!,height: 0),
                  AppText(
                      text: chapterActivityModel!.slNo.toString(),
                      textStyle: Theme.of(context).textTheme.headline2),
                ],
              ),
              AppTitleText(title: chapterActivityModel!.email!, isSubTitle: true,),
              AppTitleText(title: S.of(context).activityPerformedHeader,height: 2),
              AppTitleText(title: chapterActivityModel!.activityPerformed!, isSubTitle: true,height: 0,)
            ],
          ),
        );
      },
    );
  }
}
