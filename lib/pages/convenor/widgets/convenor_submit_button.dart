import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_button.dart';
import 'package:net_pro_fan/generated/l10n.dart';

class ConvenorSubmitButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const ConvenorSubmitButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: AppElevatedButton(
        onPressed: onPressed,
        text: S.of(context).submit,
        height: 40,
        width: 90,
        margin: const EdgeInsets.only(top: 15, bottom: 5),
      ),
    );
  }
}
