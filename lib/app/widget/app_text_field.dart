import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final String? hint;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextField({
    Key? key,
    this.controller,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.name,
    @required this.hint, this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (BuildContext context, ThemeProvider themeProvider, _) {
        return SizedBox(
          height: 42,
          child: TextFormField(
            controller: controller,
            textInputAction: textInputAction,
            keyboardType: keyboardType,
            cursorColor: ColorConstant.appBlack,
            cursorWidth: 1,
            inputFormatters: inputFormatters,
            style:
                Theme.of(context).textTheme.headline3!.copyWith(fontSize: 14,color: ColorConstant.appBlack),
            decoration: InputDecoration(
              hintText: hint!,
              hintStyle: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(fontSize: 15, fontWeight: FontWeight.w500,color: ColorConstant.appGrey),
              filled: true,
              fillColor: themeProvider.isDarkMode
                  ? ColorConstant.appWhite.withOpacity(0.7)
                  : ColorConstant.appWhite,
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              border: ColorConstant.appOutlineInputBorder(),
              disabledBorder: ColorConstant.appOutlineInputBorder(),
              enabledBorder: ColorConstant.appOutlineInputBorder(),
              errorBorder: ColorConstant.appOutlineInputBorder(
                  color: ColorConstant.appRed),
              focusedBorder: ColorConstant.appOutlineInputBorder(
                  color: ColorConstant.appRed),
            ),
          ),
        );
      },
    );
  }
}
