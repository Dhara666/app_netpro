import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_label_text.dart';
import 'package:net_pro_fan/app/widget/app_text.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/model/chapter_model.dart';
import 'package:net_pro_fan/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ChapterCardView extends StatelessWidget {
  final bool isScore;

  final ChapterModel? chapterModel;

  const ChapterCardView({Key? key, this.isScore = false, this.chapterModel}) : super(key: key);

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
                  if (!isScore) AppTitleText(title: chapterModel!.nameOfMember!, height: 2),
                  AppText(text: chapterModel!.slNo.toString(), textStyle: Theme.of(context).textTheme.headline2),
                ],
              ),
              if (!isScore)
                const SizedBox(
                  height: 5,
                ),
              if (!isScore) AppTitleText(title: S.of(context).organizations, height: 2),
              if (!isScore) AppTitleText(title: chapterModel!.association!, isSubTitle: true),
              if (!isScore) AppTitleText(title: S.of(context).chapterName, height: 2),
              if (!isScore) AppTitleText(title: chapterModel!.chapterName!, isSubTitle: true),
              if (!isScore) AppTitleText(title: S.of(context).contact, height: 2),
              if (!isScore) AppTitleText(title: chapterModel!.contact!.toString(), isSubTitle: true),
              AppTitleText(title: S.of(context).score, height: 2),
              AppTitleText(title: chapterModel!.score!.toString(), isSubTitle: true, height: 0),
            ],
          ),
        );
      },
    );
  }
}
