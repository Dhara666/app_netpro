import 'dart:io';
import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_text.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/providers/theme_provider.dart';

class AppFileCard extends StatelessWidget {
  final ThemeProvider themeProvider;
  final dynamic provider;
  final File? chooseDoc;

  const AppFileCard(
      {Key? key,
      required this.themeProvider,
      required this.provider,
      required this.chooseDoc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      decoration: ColorConstant.appCardDecoration(themeProvider.isDarkMode),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              provider.selectDocFunction();
            },
            child: Container(
              height: 50,
              width: 110,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: ColorConstant.appGrey.withOpacity(0.2),
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  border: Border.all(
                      color: ColorConstant.appGrey.withOpacity(0.5))),
              child: Center(
                  child: AppText(
                text: S.of(context).chooseFiles,
                textStyle: Theme.of(context).textTheme.headline3!.copyWith(
                      fontSize: 13,
                      color: ColorConstant.appGrey,
                    ),
              )),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: IgnorePointer(
              ignoring: chooseDoc == null
                  ? true
                  : false,
              child: GestureDetector(
                onTap: () {chooseDoc != null
                      ? provider.docViewFunction(context)
                      : provider.selectDocFunction();
                },
                child: AppText(
                  text: chooseDoc != null
                      ? chooseDoc!.absolute.path.split('/').last
                      : S.of(context).noFilesChoosen,
                  maxLines: 2,
                  textStyle: Theme.of(context).textTheme.headline2!.copyWith(
                      color: ColorConstant.appGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                  decoration: chooseDoc != null
                      ? TextDecoration.underline
                      : TextDecoration.none,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
