import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_header_view.dart';
import 'package:net_pro_fan/constant/app_list.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/pages/public_members/widgets/streering_committee_text_view.dart';

class SteeringCommitteePage extends StatelessWidget {
  const SteeringCommitteePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppHeaderView(title: S.of(context).steeringCommittee.toUpperCase()),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: AppList.steeringCommitteeMembersList.length,
            itemBuilder: (context, index) => SteeringCommitteeTextView(
              title: AppList.steeringCommitteeMembersList[index],
            ),
          ),
        ),
      ],
    );
  }
}
