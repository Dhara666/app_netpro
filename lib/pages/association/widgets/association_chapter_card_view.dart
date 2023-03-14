import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_button.dart';
import 'package:net_pro_fan/app/widget/app_label_text.dart';
import 'package:net_pro_fan/app/widget/app_text.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/model/association_model.dart';
import 'package:net_pro_fan/model/association_my_chapters_model.dart';
import 'package:net_pro_fan/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class AssociationChapterCardView extends StatelessWidget {
  final bool isOnGoingChapters;
  final bool isMyChapters;
  final bool isAllChapters;
  final AssociationChapterModel? associationChapterModel;
  final ChapterModel? chapterModel;

  const AssociationChapterCardView(
      {Key? key, this.associationChapterModel, this.isOnGoingChapters = false, this.chapterModel, this.isMyChapters = false, this.isAllChapters = false})
      : super(key: key);

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
                  AppTitleText(
                    title: chapterModel != null ? chapterModel!.chapterName! : associationChapterModel!.chapterName!,
                  ),
                  AppText(
                      text: chapterModel != null ? chapterModel!.serialNumber.toString() : associationChapterModel!.slNo.toString(),
                      textStyle: Theme.of(context).textTheme.headline2),
                ],
              ),
              AppTitleText(title: S.of(context).chapterStatus),
              AppTitleText(title: chapterModel != null ? chapterModel!.chapterStatus! : associationChapterModel!.chapterStatus!, isSubTitle: true),
              AppTitleText(title: S.of(context).chapterCity),
              AppTitleText(title: chapterModel != null ? chapterModel!.city! : associationChapterModel!.chapterCity!, isSubTitle: true),
              AppTitleText(title: S.of(context).chapterState),
              AppTitleText(title: chapterModel != null ? chapterModel!.state! : associationChapterModel!.chapterStatus!, isSubTitle: true),
              if (isOnGoingChapters || isAllChapters) AppTitleText(title: S.of(context).chapterCreatedBy),
              if (isOnGoingChapters || isAllChapters)
                AppTitleText(title: chapterModel != null ? chapterModel!.createdBy! : associationChapterModel!.chapterCreatedBy!, isSubTitle: true),
              if (isAllChapters) AppTitleText(title: S.of(context).alertChapterRemove),
              if (isAllChapters) const AppTitleText(title: 'Yes', isSubTitle: true,isRed: true),
              if (isAllChapters) AppTitleText(title: S.of(context).chapterRemoveReason),
              if (isAllChapters) const AppTitleText(title: 'Removing lapen india association', isSubTitle: true, height: 0,isRed: true),
              if (isOnGoingChapters) AppTitleText(title: S.of(context).yourParticipationStatus),
              if (isOnGoingChapters)
                AppTitleText(
                    title: chapterModel != null ? chapterModel!.participationStatus! : associationChapterModel!.yourParticipationStatus!,
                    isSubTitle: true,
                    height: 0),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppElevatedButton(
                    onPressed: () {},
                    text: S.of(context).viewDetails,
                    height: 28,
                    width: 90,
                    fontSize: 12,
                    margin: const EdgeInsets.only(right: 10),
                    buttonColor: ColorConstant.appBlue,
                  ),
                  if (isMyChapters)
                    AppElevatedButton(
                      onPressed: () {},
                      text: S.of(context).documents,
                      height: 28,
                      width: 90,
                      fontSize: 12,
                      buttonColor: ColorConstant.appBlue,
                    ),
                  if (isOnGoingChapters)
                    AppElevatedButton(
                      onPressed: () {},
                      text: S.of(context).participate,
                      height: 28,
                      width: 90,
                      fontSize: 12,
                      buttonColor: ColorConstant.appBlue,
                    )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        );
      },
    );
  }
}
