import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_appbar.dart';
import 'package:net_pro_fan/app/widget/app_button.dart';
import 'package:net_pro_fan/app/widget/app_dropdown_button.dart';
import 'package:net_pro_fan/app/widget/app_header_view.dart';
import 'package:net_pro_fan/app/widget/app_label_text.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/app/widget/app_date_card.dart';
import 'package:net_pro_fan/app/widget/app_file_card.dart';
import 'package:net_pro_fan/providers/member_selected_activity_type_provider.dart';
import 'package:net_pro_fan/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class MemberSelectedActivityTpePage extends StatelessWidget {
  const MemberSelectedActivityTpePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer2<MemberSelectedActivityTypeProvider, ThemeProvider>(
        builder: (BuildContext context,
            MemberSelectedActivityTypeProvider
                memberSelectedActivityTypeProvider,
            ThemeProvider themeProvider,
            _) {
          return Scaffold(
            appBar: AppAppBar(
              showDrawer: false,
              showUser: false,
            ),
            body: Column(
              children: [
                AppHeaderView(title: S.of(context).addSelectedActivity),
                AppElevatedButton(
                  text: S.of(context).pleaseProceedWithBelowFormAndSubmit,
                  height: 40,
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 22),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10, top: 25),
                      decoration: BoxDecoration(
                        color: ColorConstant.appGrey.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(14),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: themeProvider.isDarkMode
                                ? ColorConstant.appLightGrey.withOpacity(0.5)
                                : ColorConstant.appLightGrey),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppLabelText(
                              title: S.of(context).activityName,
                            ),
                            AppDropdownButton(
                              hint: S.of(context).notSelected,
                              value: memberSelectedActivityTypeProvider
                                  .activityName,
                              dropdownItems: memberSelectedActivityTypeProvider
                                  .activityNameItem,
                              onChanged: (String? request) {
                                memberSelectedActivityTypeProvider
                                    .activityNameOnChanged(request);
                              },
                            ),
                            AppLabelText(
                              title: S.of(context).dateOfActivityPerformed,
                            ),
                            AppDateCard(
                                themeProvider: themeProvider,
                                provider:
                                    memberSelectedActivityTypeProvider),
                            AppLabelText(
                              title: S.of(context).levelOfActivity,
                            ),
                            AppDropdownButton(
                              hint: S.of(context).notSelected,
                              value: memberSelectedActivityTypeProvider
                                  .levelOfActivity,
                              dropdownItems: memberSelectedActivityTypeProvider
                                  .levelOfActivityItem,
                              onChanged: (String? request) {
                                memberSelectedActivityTypeProvider
                                    .levelOfActivityOnChanged(request);
                              },
                            ),
                            AppLabelText(
                              title: S.of(context).uploadSupportingDocuments,
                            ),
                            AppFileCard(
                              themeProvider: themeProvider,
                              provider: memberSelectedActivityTypeProvider,
                              chooseDoc: memberSelectedActivityTypeProvider.chooseDoc,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: AppElevatedButton(
                                onPressed: () {
                                  memberSelectedActivityTypeProvider
                                      .validateForm(context);
                                },
                                text: S.of(context).submit,
                                height: 40,
                                width: 90,
                                margin:
                                    const EdgeInsets.only(top: 15, bottom: 5),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
