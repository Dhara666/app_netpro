import 'package:flutter/material.dart';
import 'package:net_pro_fan/constant/app_list.dart';
import 'package:net_pro_fan/pages/member/widgets/member_activity_performed_card_view.dart';

class MemberActivityPerformedPage extends StatelessWidget {
  const MemberActivityPerformedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: AppList.memberActivityPerformedList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => MemberActivityPerformedCardView(
              memberActivityPerformedModel:
                  AppList.memberActivityPerformedList[index],
            ));
  }
}
