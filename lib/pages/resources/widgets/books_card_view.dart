import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_label_text.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class BooksCardView extends StatelessWidget {
  final String bookName;
  final GestureTapCallback onTap;

  const BooksCardView({Key? key, required this.bookName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (BuildContext context, ThemeProvider themeProvider, _) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: ColorConstant.appDecoration(themeProvider.isDarkMode),
            child: AppTitleText(title: bookName),
          ),
        );
      },
    );
  }
}
