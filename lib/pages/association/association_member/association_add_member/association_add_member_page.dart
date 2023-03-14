import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:net_pro_fan/app/widget/app_button.dart';
import 'package:net_pro_fan/app/widget/app_dropdown_button.dart';
import 'package:net_pro_fan/app/widget/app_label_text.dart';
import 'package:net_pro_fan/app/widget/app_text_field.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/providers/association_add_member_provider.dart';
import 'package:net_pro_fan/providers/local_data_provider.dart';
import 'package:net_pro_fan/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class AssociationAddMemberPage extends StatefulWidget {
  const AssociationAddMemberPage({Key? key}) : super(key: key);

  @override
  State<AssociationAddMemberPage> createState() => _AssociationAddMemberPageState();
}

class _AssociationAddMemberPageState extends State<AssociationAddMemberPage> {
  @override
  void initState() {
    // TODO: implement initState
    LocalDataProvider localDataProvider = Provider.of<LocalDataProvider>(context, listen: false);
    localDataProvider.getState(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<AssociationAddMemberProvider, ThemeProvider>(
      builder: (context, associationAddMemberProvider, themeProvider, _) {
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 25),
                    decoration: BoxDecoration(
                      color: ColorConstant.appGrey.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(14),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(color: themeProvider.isDarkMode ? ColorConstant.appLightGrey.withOpacity(0.5) : ColorConstant.appLightGrey),
                      child: Consumer<LocalDataProvider>(
                        builder: (context, localDataProvider, _) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppLabelText(title: S.of(context).memberNameLabel),
                              AppTextField(
                                hint: S.of(context).memberName,
                                controller: associationAddMemberProvider.memberNameController,
                              ),
                              AppLabelText(title: S.of(context).memberContactNumberLabel),
                              AppTextField(
                                hint: S.of(context).memberContactNumber,
                                keyboardType: TextInputType.number,
                                controller: associationAddMemberProvider.contactNumberController,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(10),
                                ],
                              ),
                              AppLabelText(title: S.of(context).memberEmailLabel),
                              AppTextField(
                                hint: S.of(context).memberEmail,
                                keyboardType: TextInputType.emailAddress,
                                controller: associationAddMemberProvider.emailController,
                              ),
                              AppLabelText(title: S.of(context).memberStateLabel),
                              AppDropdownButton(
                                hint: S.of(context).notSelected,
                                value: associationAddMemberProvider.selectedState,
                                dropdownItems: localDataProvider.stateList,
                                onChanged: (String? request) {
                                  associationAddMemberProvider.stateOnChanged(context, request, localDataProvider);
                                },
                              ),
                              AppLabelText(title: S.of(context).memberCityLabel),
                              AppDropdownButton(
                                hint: S.of(context).notSelected,
                                value: associationAddMemberProvider.selectedCity,
                                dropdownItems: localDataProvider.cityList,
                                onChanged: (String? request) {
                                  associationAddMemberProvider.cityOnChanged(request);
                                },
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: AppElevatedButton(
                                  onPressed: () =>associationAddMemberProvider.validateForm(context),
                                  text: S.of(context).addMember,
                                  height: 30,
                                  width: 90,
                                  fontSize: 12,
                                  buttonColor: ColorConstant.appGreen,
                                  margin: const EdgeInsets.only(top: 15, bottom: 5),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
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
