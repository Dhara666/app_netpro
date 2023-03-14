import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_label_text.dart';
import 'package:net_pro_fan/app/widget/app_text.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/model/association_member_model.dart';
import 'package:net_pro_fan/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class AssociationMemberCardView extends StatelessWidget {
  final AssoiciationMemberModel? assoiciationMemberModel;

  const AssociationMemberCardView({Key? key, this.assoiciationMemberModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (BuildContext context, ThemeProvider themeProvider, _) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: ColorConstant.appDecoration(themeProvider.isDarkMode),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppTitleText(title: assoiciationMemberModel!.memberName!),
                  AppText(text: assoiciationMemberModel!.serialNumber.toString(), textStyle: Theme.of(context).textTheme.headline2),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              AppTitleText(title: S.of(context).memberState),
              AppTitleText(title: assoiciationMemberModel!.memberState!, isSubTitle: true),
              AppTitleText(title: S.of(context).memberCity),
              AppTitleText(title: assoiciationMemberModel!.memberCityName!, isSubTitle: true),
              AppTitleText(title: S.of(context).contactNo),
              AppTitleText(title: assoiciationMemberModel!.memberContactNum!, isSubTitle: true),
              AppTitleText(title: S.of(context).emailLabel),
              AppTitleText(title: assoiciationMemberModel!.memberEmail!, isSubTitle: true),
              AppTitleText(title: S.of(context).registeredBy),
              AppTitleText(title: assoiciationMemberModel!.registeredBy ??"", isSubTitle: true),
              AppTitleText(title: S.of(context).participationStatus),
              AppTitleText(title: assoiciationMemberModel!.memberOccupiedStatus! , isSubTitle: true),
              AppTitleText(title: S.of(context).memberStatus),
              AppTitleText(title: assoiciationMemberModel!.memberStatus! , isSubTitle: true),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppTitleText(title: S.of(context).isActive),
                  AppTitleText(title: assoiciationMemberModel!.isActive! , isSubTitle: true),
                  const Spacer(),
                  AppTitleText(title: S.of(context).isMember),
                  AppTitleText(title: assoiciationMemberModel!.typeMember! , isSubTitle: true),
                  const Spacer(),
                ],
              ),
              Row(
                children: [
                  AppTitleText(title: S.of(context).isConvener),
                  AppTitleText(title: assoiciationMemberModel!.isActive! , isSubTitle: true),
                  const Spacer(),
                  AppTitleText(title: S.of(context).isCoConvener),
                  AppTitleText(title: assoiciationMemberModel!.typeCoConvener! , isSubTitle: true),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }
}
