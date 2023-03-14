import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:net_pro_fan/app/widget/app_appbar.dart';
import 'package:net_pro_fan/app/widget/app_dropdown_button.dart';
import 'package:net_pro_fan/app/widget/app_header_view.dart';
import 'package:net_pro_fan/app/widget/app_label_text.dart';
import 'package:net_pro_fan/app/widget/app_text_field.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/pages/convenor/widgets/convenor_submit_button.dart';
import 'package:net_pro_fan/providers/add_member_provider.dart';
import 'package:net_pro_fan/providers/local_data_provider.dart';
import 'package:net_pro_fan/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class AddMemberPage extends StatefulWidget {
  const AddMemberPage({Key? key}) : super(key: key);

  @override
  State<AddMemberPage> createState() => _AddMemberPageState();
}

class _AddMemberPageState extends State<AddMemberPage> {
  @override
  void initState() {
    // TODO: implement initState
    LocalDataProvider localDataProvider = Provider.of<LocalDataProvider>(context, listen: false);
    localDataProvider.getState(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer2<AddMemberProvider, ThemeProvider>(
        builder: (context, addMemberProvider, themeProvider, _) {
          return Scaffold(
            appBar: AppAppBar(
              showDrawer: false,
              showUser: false,
            ),
            body: Column(
              children: [
                AppHeaderView(title: S.of(context).addMember),
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
                        decoration: BoxDecoration(
                            color: themeProvider.isDarkMode
                                ? ColorConstant.appLightGrey.withOpacity(0.5)
                                : ColorConstant.appLightGrey),
                        child: Consumer<LocalDataProvider>(
                          builder: (context, localDataProvider, _) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppLabelText(title: S.of(context).personName),
                                AppTextField(
                                  hint: S.of(context).personNameHint,
                                  controller: addMemberProvider.personNameController,
                                ),
                                AppLabelText(title: S.of(context).contactLabel),
                                AppTextField(
                                  hint: S.of(context).memberContact,
                                  keyboardType: TextInputType.phone,
                                  controller: addMemberProvider.contactController,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                ),
                                AppLabelText(title: S.of(context).email),
                                AppTextField(
                                  hint: S.of(context).emailHint,
                                  keyboardType: TextInputType.emailAddress,
                                  controller: addMemberProvider.emailController,
                                ),
                                AppLabelText(title: S.of(context).confirmEmailLabel),
                                AppTextField(
                                  hint: S.of(context).confirmEmail,
                                  keyboardType: TextInputType.emailAddress,
                                  controller: addMemberProvider.confirmEmailController,
                                ),
                                AppLabelText(title: S.of(context).state),
                                AppDropdownButton(
                                  hint: S.of(context).notSelected,
                                  value: addMemberProvider.selectedState,
                                  dropdownItems: localDataProvider.stateList,
                                  onChanged: (String? request) {
                                    addMemberProvider.stateOnChanged(context,request,localDataProvider);
                                  },
                                ),
                                AppLabelText(title: S.of(context).city),
                                AppDropdownButton(
                                  hint: S.of(context).notSelected,
                                  value: addMemberProvider.selectedCity,
                                  dropdownItems: localDataProvider.cityList,
                                  onChanged: (String? request) {
                                    addMemberProvider.cityOnChanged(request);
                                  },
                                ),
                                ConvenorSubmitButton(onPressed: () => addMemberProvider.validateForm(context))
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
      ),
    );
  }
}
