import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_dropdown_button.dart';
import 'package:net_pro_fan/app/widget/app_header_view.dart';
import 'package:net_pro_fan/app/widget/app_text.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/pages/chapter_activity/widgets/chapter_activity_card_view.dart';
import 'package:net_pro_fan/providers/chapter_activity_provider.dart';
import 'package:provider/provider.dart';

class ChapterActivityPage extends StatelessWidget {
  const ChapterActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ChapterActivityProvider>(
      builder: (BuildContext context,
          ChapterActivityProvider chapterActivityProvider, _) {
        return Scaffold(
          body: Column(
            children: [
              AppHeaderView(
                  title: S.of(context).progressDetails.toUpperCase()),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: AppText(
                  text: S.of(context).pleaseSelectYourActivityCategory,
                  textStyle: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(fontSize: 13),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 15),
                child: AppDropdownButton(
                  hint: S.of(context).notSelected,
                  dropdownWidth: 328,
                  value: chapterActivityProvider.selectActivityCategory,
                  dropdownItems: chapterActivityProvider.activityCategory,
                  onChanged: (String? request) {
                    chapterActivityProvider.pageIndex = chapterActivityProvider
                        .activityCategoryDataList
                        .indexWhere((element) =>
                            element['activityCategory'] == request);
                    chapterActivityProvider.selectedActivityCategoryData =
                        chapterActivityProvider.activityCategoryDataList[
                            chapterActivityProvider.pageIndex!]['data'];
                    chapterActivityProvider.activityTypeOnChanged(request);
                  },
                ),
              ),
              if (chapterActivityProvider.selectActivityCategory != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      text: S.of(context).selectedActivity,
                      textStyle: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(fontSize: 13),
                    ),
                    AppText(
                      text: chapterActivityProvider.selectActivityCategory,
                      textStyle: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontSize: 13),
                    ),
                  ],
                ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  primary: true,
                  itemCount: chapterActivityProvider
                      .selectedActivityCategoryData.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      ChapterActivityCardView(
                          chapterActivityModel: chapterActivityProvider
                              .selectedActivityCategoryData[index]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
