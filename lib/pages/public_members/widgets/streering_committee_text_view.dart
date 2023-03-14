import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_text.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class SteeringCommitteeTextView extends StatelessWidget {
  final String title;

  const SteeringCommitteeTextView({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (BuildContext context, ThemeProvider themeProvider, _) {
        return Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          decoration: ColorConstant.appDecoration(themeProvider.isDarkMode),
          child: AppText(
            text: title,
            textAlign: TextAlign.start,
            textStyle: Theme.of(context).textTheme.headline2!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
        );
      },
    );
  }
}
