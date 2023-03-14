import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_image_assets.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class PosterCardView extends StatelessWidget {
  final String image;

  const PosterCardView({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (BuildContext context, ThemeProvider themeProvider, _) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: ColorConstant.appDecoration(themeProvider.isDarkMode),
            child: AppImageAsset(
              image: image,
              height: 120,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
        );
      },
    );
  }
}
