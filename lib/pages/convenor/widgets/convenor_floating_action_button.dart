import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/providers/convenor_provider.dart';
import 'package:provider/provider.dart';

class ConvenorFloatingActionButton extends StatelessWidget {
  const ConvenorFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ConvenorProvider>(
      builder: (BuildContext context, ConvenorProvider convenorProvider, _) {
        return SpeedDial(
          icon: Icons.add,
          childrenButtonSize: const Size(55.0, 55.0),
          curve: Curves.bounceIn,
          backgroundColor: ColorConstant.appBlue,
          buttonSize: const Size(45.0, 45.0),
          overlayColor: ColorConstant.appBlack,
          overlayOpacity: 0.5,
          childMargin: const EdgeInsets.only(bottom: 10,right: 0),
          childPadding: const EdgeInsets.only(bottom: 12,left: 12),
          foregroundColor: Colors.white,
          elevation: 5.0,
          shape: const CircleBorder(),
          children: [
            speedDialChild(
                label: S.of(context).addMember,
                icon: Icons.person,
                onTap: () => convenorProvider.gotoAddMemberPage(context)),
            speedDialChild(
                label: S.of(context).addActivity,
                icon: Icons.local_activity,
                onTap: () => convenorProvider.gotoAddActivityPage(context)),
          ],
        );
      },
    );
  }

  SpeedDialChild speedDialChild(
      {@required String? label,
      @required IconData? icon,
      @required VoidCallback? onTap}) {
    return SpeedDialChild(
        child: Icon(
          icon!,
          color: ColorConstant.appWhite,
          size: 18,
        ),
        backgroundColor: ColorConstant.appSkyBlue,
        label: label!.toUpperCase(),
        labelStyle:
            const TextStyle(color: ColorConstant.appWhite, fontSize: 10),
        labelBackgroundColor: ColorConstant.appSkyBlue,
        onTap: onTap);
  }
}
