import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_button.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/providers/dashboard_provider.dart';
import 'package:net_pro_fan/providers/login_provider.dart';
import 'package:provider/provider.dart';

class LoginButtonView extends StatelessWidget {
  const LoginButtonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<LoginProvider, DashBoardProvider>(
      builder: (BuildContext context, LoginProvider loginProvider,
          DashBoardProvider dashBoardProvider, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppElevatedButton(
              onPressed: () {
                loginProvider.validateForm(context, dashBoardProvider);
              },
              text: S.of(context).submit,
              height: 40,
              width: 85,
              buttonColor: ColorConstant.appYellow,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: AppElevatedButton(
                text: S.of(context).wantToBecomeAMember,
                height: 40,
                onPressed: () => dashBoardProvider.goToRegister(),
                buttonColor: ColorConstant.appYellow,
              ),
            )
          ],
        );
      },
    );
  }
}
