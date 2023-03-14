import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_text.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/providers/theme_provider.dart';

class AppDateCard extends StatelessWidget {
  final ThemeProvider themeProvider;
  final dynamic provider;

  const AppDateCard(
      {Key? key,
      required this.themeProvider,
      required this.provider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          provider.selectDateFunction(context),
      child: Container(
        height: 42,
        decoration: ColorConstant.appCardDecoration(themeProvider.isDarkMode),
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
                text: provider.selectedDate == null
                    ? S.of(context).ddMmYyyy
                    : "${provider.selectedDate!.toLocal()}"
                        .split(' ')[0],
                textStyle: provider.selectedDate ==
                        null
                    ? Theme.of(context).textTheme.subtitle2!.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: ColorConstant.appGrey)
                    : Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontSize: 14, color: ColorConstant.appBlack)),
            Icon(
              Icons.calendar_today,
              color: ColorConstant.appBlack.withOpacity(0.6),
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}
