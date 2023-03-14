import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_custom_expansion_tile.dart';
import 'package:net_pro_fan/constant/app_list.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/pages/convenor/widgets/ambassador_card_view.dart';
import 'package:net_pro_fan/pages/convenor/widgets/chapter_card_view.dart';
import 'package:net_pro_fan/pages/convenor/widgets/member_card_view.dart';
import 'package:net_pro_fan/providers/chapter_details_provider.dart';
import 'package:provider/provider.dart';

class ChapterDetailsPage extends StatelessWidget {
  const ChapterDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ChapterDetailsProvider>(
      builder: (BuildContext context,
          ChapterDetailsProvider chapterDetailsProvider, _) {
        return ListView(
          children: [
            AppCustomExpansionTile(
              onExpansionChanged: ((newState) {
                chapterDetailsProvider.onExpansionChanged();
              }),
              headerBackgroundColor: ColorConstant.appYellow,
              title: S.of(context).chapterDetails,
              children: [
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: AppList.chapterList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ChapterCardView(
                          chapterModel: AppList.chapterList[index],
                        ))
              ],
            ),
            AppCustomExpansionTile(
              onExpansionChanged: ((newState) {
                chapterDetailsProvider.onExpansionChanged();
              }),
              headerBackgroundColor: ColorConstant.appYellow,
              title: S.of(context).memberList,
              subTitle: '(20)',
              children: [
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: AppList.memberList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => MemberCardView(
                          memberModel: AppList.memberList[index],
                        ))
              ],
            ),
            AppCustomExpansionTile(
              onExpansionChanged: ((newState) {
                chapterDetailsProvider.onExpansionChanged();
              }),
              headerBackgroundColor: ColorConstant.appYellow,
              title: S.of(context).ambassadorList,
              subTitle: '(2)',
              children: [
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: AppList.ambassadorList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => AmbassadorCardView(
                          ambassadorModel: AppList.ambassadorList[index],
                        ))
              ],
            ),
            const SizedBox(
              height: 60,
            )
          ],
        );
      },
    );
  }
}
