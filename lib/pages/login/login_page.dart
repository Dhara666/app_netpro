import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_header_view.dart';
import 'package:net_pro_fan/app/widget/app_label_text.dart';
import 'package:net_pro_fan/app/widget/app_text_field.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/pages/login/widgets/login_button_view.dart';
import 'package:net_pro_fan/pages/login/widgets/login_user_image.dart';
import 'package:net_pro_fan/providers/login_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LoginProvider>(
        builder: (BuildContext context, LoginProvider loginProvider, _) {
          return Column(children: [
            AppHeaderView(title: S.of(context).login),
            Expanded(
              child: ListView(
                primary: true,
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: 15, right: 15),
                children: [
                  const LoginUserImage(),
                  AppLabelText(title: S.of(context).userName),
                  AppTextField(
                    hint: S.of(context).pleaseEnterUserName,
                    keyboardType: TextInputType.name,
                    controller: loginProvider.userNameController,
                  ),
                  AppLabelText(title: S.of(context).password),
                  AppTextField(
                    hint: S.of(context).pleaseEnterPassword,
                    keyboardType: TextInputType.name,
                    controller: loginProvider.passwordController,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const LoginButtonView(),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ]);
        },
      ),
    );
  }
}
