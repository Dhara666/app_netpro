import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:net_pro_fan/app/widget/app_dropdown_button.dart';
import 'package:net_pro_fan/app/widget/app_header_view.dart';
import 'package:net_pro_fan/app/widget/app_label_text.dart';
import 'package:net_pro_fan/app/widget/app_text_field.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/pages/register/widgets/register_submit_button.dart';
import 'package:net_pro_fan/providers/local_data_provider.dart';
import 'package:net_pro_fan/providers/register_provider.dart';
import 'package:net_pro_fan/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
      child: Consumer2<RegisterProvider, ThemeProvider>(
        builder: (context, registerProvider, themeProvider, _) {
          return Scaffold(
            body: Column(
              children: [
                AppHeaderView(title: S.of(context).newMemberRegistration),
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
                                AppLabelText(
                                  title: S.of(context).requestType,
                                ),
                                AppDropdownButton(
                                  hint: S.of(context).notSelected,
                                  value: registerProvider.selectedRequestType,
                                  dropdownItems: registerProvider.requestList,
                                  onChanged: (String? request) {
                                    registerProvider.requestTypeOnChanged(request);
                                  },
                                ),
                                AppLabelText(title: S.of(context).nameOfMember),
                                AppTextField(
                                  hint: S.of(context).memberName,
                                  controller: registerProvider.memberNameController,
                                ),
                                AppLabelText(title: S.of(context).email),
                                AppTextField(
                                  hint: S.of(context).memberEmail,
                                  keyboardType: TextInputType.emailAddress,
                                  controller: registerProvider.emailController,
                                ),
                                AppLabelText(title: S.of(context).mobile),
                                AppTextField(
                                  hint: S.of(context).mobileHint,
                                  keyboardType: TextInputType.phone,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                  controller: registerProvider.mobileController,
                                ),
                                AppLabelText(title: S.of(context).organization),
                                AppTextField(
                                  hint: S.of(context).organizationName,
                                  controller: registerProvider.organizationNameController,
                                ),
                                AppLabelText(title: S.of(context).state),
                                AppDropdownButton(
                                  hint: S.of(context).notSelected,
                                  value: registerProvider.selectedState,
                                  dropdownItems: localDataProvider.stateList,
                                  onChanged: (String? request) {
                                    registerProvider.stateOnChanged(context,request,localDataProvider);
                                  },
                                ),
                                AppLabelText(title: S.of(context).city),
                                AppDropdownButton(
                                  hint: S.of(context).notSelected,
                                  value: registerProvider.selectedCity,
                                  dropdownItems: localDataProvider.cityList,
                                  onChanged: (String? request) {
                                    registerProvider.cityOnChanged(request);
                                  },
                                ),
                                if (registerProvider.selectedRequestType == registerProvider.requestList[0])
                                  AppLabelText(title: S.of(context).professionalAssociationLabel),
                                if (registerProvider.selectedRequestType == registerProvider.requestList[0]) const SizedBox(height: 8),
                                if (registerProvider.selectedRequestType == registerProvider.requestList[0])
                                  AppDropdownButton(
                                    hint: S.of(context).notSelected,
                                    value: registerProvider.selectedProfession,
                                    dropdownItems: registerProvider.professionList,
                                    onChanged: (String? request) {
                                      registerProvider.professionOnChanged(request);
                                    },
                                  ),
                                RegisterSubmitButton(registerProvider: registerProvider)
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
