import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:net_pro_fan/app/utills/shared_preference.dart';
import 'package:net_pro_fan/constant/app_asset.dart';
import 'package:net_pro_fan/constant/color_constant.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = false;
  ThemeData? selectedThemeData;

  ThemeData lightTheme = ThemeData(
      fontFamily: AppAsset.defaultFont,
      dividerColor: ColorConstant.appBlue,
      scaffoldBackgroundColor: ColorConstant.appWhite,
      textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: ColorConstant.appWhite),
        headline2: TextStyle(
          color: ColorConstant.appBlue,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
        headline3: TextStyle(
          color: ColorConstant.appBlack,
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
        headline4: TextStyle(
          color: ColorConstant.appWhite,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
        headline5: TextStyle(
            color: ColorConstant.appWhite,
            fontSize: 14,
            fontWeight: FontWeight.w500),
        subtitle1: TextStyle(
          color: ColorConstant.appBlack,
          fontSize: 11,
          fontWeight: FontWeight.w700,
        ),
        subtitle2: TextStyle(
          color: ColorConstant.appGrey,
          fontWeight: FontWeight.w600,
          fontSize: 9,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          shadowColor: MaterialStateProperty.all(ColorConstant.appTransparent),
        ),
      ),
      drawerTheme:
          const DrawerThemeData(backgroundColor: ColorConstant.appWhite),
      iconTheme: const IconThemeData(color: ColorConstant.appWhite, size: 20));

  ThemeData darkTheme = ThemeData(
    fontFamily: AppAsset.defaultFont,
    dividerColor: ColorConstant.appWhite,
    scaffoldBackgroundColor: ColorConstant.appDarkBlack,
    textTheme: TextTheme(
      headline1: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: ColorConstant.appLightBlack,
      ),
      headline2: const TextStyle(
        color: ColorConstant.appWhite,
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
      headline3: const TextStyle(
        color: ColorConstant.appWhite,
        fontWeight: FontWeight.w500,
        fontSize: 15,
      ),
      headline4: const TextStyle(
        color: ColorConstant.appGrey,
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
      headline5: const TextStyle(
          color: ColorConstant.appGrey,
          fontSize: 14,
          fontWeight: FontWeight.w500),
      subtitle1: const TextStyle(
        color: ColorConstant.appWhite,
        fontSize: 11,
        fontWeight: FontWeight.w700,
      ),
      subtitle2: TextStyle(
        color: ColorConstant.appWhite.withOpacity(0.8),
        fontWeight: FontWeight.w700,
        fontSize: 9,
      ),
    ),
    drawerTheme:
        const DrawerThemeData(backgroundColor: ColorConstant.appDarkBlack),
    iconTheme: const IconThemeData(color: ColorConstant.appWhite, size: 20),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        // backgroundColor: MaterialStateProperty.all(ColorConstant.appRed),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        shadowColor: MaterialStateProperty.all(ColorConstant.appTransparent),
      ),
    ),
  );

  ThemeProvider() {
    Brightness brightness = SchedulerBinding.instance.window.platformBrightness;
    isDarkMode = brightness == Brightness.dark;
    selectedThemeData = isDarkMode ? darkTheme : lightTheme;
    checkTheme();
  }

  void swapTheme() async {
    selectedThemeData =
        selectedThemeData == lightTheme ? darkTheme : lightTheme;
    isDarkMode = selectedThemeData == lightTheme ? false : true;
    setPrefBoolValue(isTheme, isDarkMode);
    notifyListeners();
  }

  void checkTheme() async {
    if (await checkPrefKey(isTheme)) {
      isDarkMode = await getPrefBoolValue(isTheme);
      selectedThemeData = isDarkMode ? darkTheme : lightTheme;
      notifyListeners();
    }
  }
}
