import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_button.dart';
import 'package:net_pro_fan/app/widget/app_dropdown_button.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/providers/member_add_activity_provider.dart';
import 'package:provider/provider.dart';

class MemberAddActivityPage extends StatelessWidget {
  const MemberAddActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: true,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      children: [
        AppElevatedButton(
          text: S.of(context).pleaseSelectYourActivityType,
          height: 40,
        ),
        const SizedBox(
          height: 10,
        ),
        Consumer<MemberAddActivityProvider>(
          builder:
              (BuildContext context, MemberAddActivityProvider memberAddActivityProvider, _) {
            return Container(
              margin: const EdgeInsets.all(14),
              child: AppDropdownButton(
                hint: S.of(context).notSelected,
                value: memberAddActivityProvider.selectActivityType,
                dropdownItems: memberAddActivityProvider.activityType,
                onChanged: (String? request) {
                  memberAddActivityProvider.activityTypeOnChanged(context ,request);
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
