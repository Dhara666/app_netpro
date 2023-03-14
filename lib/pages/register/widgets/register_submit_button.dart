import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_button.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/providers/register_provider.dart';

class RegisterSubmitButton extends StatelessWidget {
  final RegisterProvider? registerProvider;

  const RegisterSubmitButton({
    Key? key,
    required this.registerProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: AppElevatedButton(
        onPressed: () {
          registerProvider!.validateForm(context);
        },
        text: S.of(context).submit,
        height: 40,
        width: 90,
        margin: const EdgeInsets.only(top: 15, bottom: 5),
      ),
    );
  }
}
