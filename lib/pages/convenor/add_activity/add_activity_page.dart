import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_appbar.dart';
import 'package:net_pro_fan/app/widget/app_button.dart';
import 'package:net_pro_fan/app/widget/app_dropdown_button.dart';
import 'package:net_pro_fan/app/widget/app_header_view.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/providers/add_activity_provider.dart';
import 'package:provider/provider.dart';

class AddActivityPage extends StatelessWidget {
  const AddActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        showDrawer: false,
        showUser: false,
      ),
      body: ListView(
        children: [
          AppHeaderView(title: S.of(context).addActivity),
          ListView(
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
              Consumer<AddActivityProvider>(
                builder:
                    (BuildContext context, AddActivityProvider addActivityProvider, _) {
                  return Container(
                    margin: const EdgeInsets.all(14),
                    child: AppDropdownButton(
                      hint: S.of(context).notSelected,
                      value: addActivityProvider.selectActivityType,
                      dropdownItems: addActivityProvider.activityType,
                      onChanged: (String? request) {
                        addActivityProvider.activityTypeOnChanged(context ,request);
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
