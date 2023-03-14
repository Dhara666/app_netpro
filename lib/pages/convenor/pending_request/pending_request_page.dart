import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_custom_expansion_tile.dart';
import 'package:net_pro_fan/constant/app_list.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/pages/convenor/widgets/activity_card_view.dart';
import 'package:net_pro_fan/pages/convenor/widgets/ambassador_card_view.dart';
import 'package:net_pro_fan/pages/convenor/widgets/member_card_view.dart';
import 'package:net_pro_fan/providers/pending_request_provider.dart';
import 'package:provider/provider.dart';

class PendingRequestPage extends StatelessWidget {
  const PendingRequestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PendingRequestProvider>(
      builder: (BuildContext context,
          PendingRequestProvider pendingRequestProvider, _) {
        return ListView(
          children: [
            AppCustomExpansionTile(
              onExpansionChanged: ((newState) {
                pendingRequestProvider.onExpansionChanged();
              }),
              headerBackgroundColor: ColorConstant.appYellow,
              title: S.of(context).memberRequest,
              subTitle: '(0)',
              children: [
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: AppList.memberList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => MemberCardView(
                          isAction: true,
                          memberModel: AppList.memberList[index],
                        ))
              ],
            ),
            AppCustomExpansionTile(
              onExpansionChanged: ((newState) {
                pendingRequestProvider.onExpansionChanged();
              }),
              headerBackgroundColor: ColorConstant.appYellow,
              title: S.of(context).ambassadorRequest,
              subTitle: '(0)',
              children: [
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: AppList.ambassadorList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => AmbassadorCardView(
                          isAction: true,
                          ambassadorModel: AppList.ambassadorList[index],
                        ))
              ],
            ),
            AppCustomExpansionTile(
              onExpansionChanged: ((newState) {
                pendingRequestProvider.onExpansionChanged();
              }),
              headerBackgroundColor: ColorConstant.appYellow,
              title: S.of(context).activityList,
              children: [
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 1,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => const ActivityCardView())
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
