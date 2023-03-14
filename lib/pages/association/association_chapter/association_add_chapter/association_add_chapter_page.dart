import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:net_pro_fan/app/widget/app_dropdown_button.dart';
import 'package:net_pro_fan/app/widget/app_label_text.dart';
import 'package:net_pro_fan/app/widget/app_text_field.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/pages/association/widgets/association_chapter_button.dart';
import 'package:net_pro_fan/providers/association_add_chapter_provider.dart';
import 'package:net_pro_fan/providers/local_data_provider.dart';
import 'package:net_pro_fan/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class AssociationAddChapterPage extends StatefulWidget {
  const AssociationAddChapterPage({Key? key}) : super(key: key);

  @override
  State<AssociationAddChapterPage> createState() => _AssociationAddChapterPageState();
}

class _AssociationAddChapterPageState extends State<AssociationAddChapterPage> {
  @override
  void initState() {
    // TODO: implement initState
    LocalDataProvider localDataProvider = Provider.of<LocalDataProvider>(context, listen: false);
    localDataProvider.getState(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<AssociationAddChapterProvider, ThemeProvider>(
      builder: (context, associationAddChapterProvider, themeProvider, _) {
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
                              AppLabelText(title: S.of(context).chapterNameLabel),
                              AppTextField(
                                hint: S.of(context).chapterNameHint,
                                controller: associationAddChapterProvider.chapterNameController,
                              ),
                              AppLabelText(title: S.of(context).contactNumber),
                              AppTextField(
                                hint: S.of(context).contactNumberHint,
                                keyboardType: TextInputType.number,
                                controller: associationAddChapterProvider.contactNumberController,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(10),
                                ],
                              ),
                              AppLabelText(title: S.of(context).email),
                              AppTextField(
                                hint: S.of(context).emailHint,
                                keyboardType: TextInputType.emailAddress,
                                controller: associationAddChapterProvider.emailController,
                              ),
                              AppLabelText(title: S.of(context).organizationType),
                              AppTextField(
                                hint: S.of(context).organizationType,
                                controller: associationAddChapterProvider.organizationTypeController,
                              ),
                              AppLabelText(title: S.of(context).organizationDetail),
                              AppTextField(
                                hint: S.of(context).organizationDetail,
                                controller: associationAddChapterProvider.organizationDetailController,
                              ),
                              AppLabelText(title: S.of(context).state),
                              AppDropdownButton(
                                hint: S.of(context).notSelected,
                                value: associationAddChapterProvider.selectedState,
                                dropdownItems: localDataProvider.stateList,
                                onChanged: (String? request) {
                                  associationAddChapterProvider.stateOnChanged(context,request,localDataProvider);
                                },
                              ),
                              AppLabelText(title: S.of(context).city),
                              AppDropdownButton(
                                hint: S.of(context).notSelected,
                                value: associationAddChapterProvider.selectedCity,
                                dropdownItems: localDataProvider.cityList,
                                onChanged: (String? request) {
                                  associationAddChapterProvider.cityOnChanged(request);
                                },
                              ),
                              const SizedBox(height: 12),
                              const AssociationChapterButton()
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
