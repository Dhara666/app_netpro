import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_text.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class HomeAboutView extends StatelessWidget {
  const HomeAboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (BuildContext context, ThemeProvider themeProvider, _) {
        return Container(
          color: themeProvider.isDarkMode
              ? ColorConstant.appDarkBlack.withOpacity(0.8)
              : ColorConstant.appLightBlue.withOpacity(0.6),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: S.of(context).about.toUpperCase(),
                textStyle: Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.w700, color: ColorConstant.appWhite),
              ),
              const Divider(
                color: ColorConstant.appYellow,
                thickness: 1,
              ),
              AppText(
                text: S.of(context).aboutDescription1,
                textStyle: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontSize: 13, color: ColorConstant.appWhite),
              ),
              AppText(
                text: S.of(context).aboutDescription2,
                textStyle: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontSize: 13, color: ColorConstant.appWhite),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        );
      },
    );
  }
}
