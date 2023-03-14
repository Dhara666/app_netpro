import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_button.dart';
import 'package:net_pro_fan/app/widget/app_image_assets.dart';
import 'package:net_pro_fan/app/widget/app_text.dart';
import 'package:net_pro_fan/constant/app_asset.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class AppCustomAlertDialog extends StatefulWidget {
  final String? message;
  final String? messageDescription;
  final String? buttonTitle;
  final bool isClose;
  final bool isImage;
  final Color buttonColor;
  final GestureTapCallback? onTap;

  const AppCustomAlertDialog(
      {Key? key,
      @required this.message,
      this.buttonTitle,
      this.onTap,
      this.isClose = true,
      this.messageDescription = '',
      this.isImage = false,
      this.buttonColor = ColorConstant.appBlue})
      : super(key: key);

  @override
  AppCustomAlertDialogState createState() => AppCustomAlertDialogState();
}

class AppCustomAlertDialogState extends State<AppCustomAlertDialog>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    scaleAnimation =
        CurvedAnimation(parent: controller!, curve: Curves.elasticInOut);

    controller!.addListener(() {
      setState(() {});
    });

    controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<ThemeProvider>(
        builder: (BuildContext context, ThemeProvider themeProvider, _) {
          return Material(
            color: Colors.transparent,
            child: ScaleTransition(
              scale: scaleAnimation!,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: themeProvider.isDarkMode
                      ? ColorConstant.appDarkBlack
                      : ColorConstant.appWhite,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 3),
                        spreadRadius: 1,
                        color: ColorConstant.appGrey.withOpacity(0.3),
                        blurRadius: 4),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: ColorConstant.appBlue,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          topLeft: Radius.circular(5),
                        ),
                      ),
                      child: widget.isImage
                          ? const AppImageAsset(
                              image: AppAsset.netProFanLogoDark,
                              height: 25,
                              width: 100,
                              fit: BoxFit.fill,
                            )
                          : AppText(
                              text: S.of(context).message,
                              textStyle: Theme.of(context).textTheme.headline4),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 8,
                          right: 8,
                          top: widget.messageDescription!.isNotEmpty ? 10 : 35,
                          bottom:
                              widget.messageDescription!.isNotEmpty ? 5 : 30),
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: AppText(
                          text: widget.message,
                          textStyle: Theme.of(context).textTheme.headline2),
                    ),
                    if (widget.messageDescription!.isNotEmpty)
                      Container(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 10, bottom: 15),
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: AppText(
                            text: widget.messageDescription,
                            textAlign: TextAlign.center,
                            textStyle: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(color: ColorConstant.appYellow)),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (widget.isClose)
                          AppElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            text: S.of(context).cancel,
                            height: 35,
                            width: 70,
                            buttonColor: ColorConstant.appBlue,
                            fontSize: 12,
                          ),
                        const SizedBox(
                          width: 20,
                        ),
                        AppElevatedButton(
                          onPressed: widget.onTap ??
                              () => Navigator.of(context).pop(true),
                          text: widget.buttonTitle ?? S.of(context).yes,
                          height: 35,
                          width: !widget.isClose ? 200 : 70,
                          buttonColor: !widget.isClose
                              ? ColorConstant.appBlue
                              : widget.buttonColor,
                          fontSize: 12,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Future appDialog(
    {String? title,
    bool isTitle = false,
    Widget? titleWidget,
    List<Widget>? actionWidget,
    @required BuildContext? context}) {
  return showDialog(
    barrierDismissible: false,
    context: context!,
    builder: (context) => AlertDialog(
        titlePadding: EdgeInsets.zero,
        title: SizedBox(
          width: 0,
          child: Column(
            children: [
              titleWidget!,
            ],
          ),
        ),
        actions: actionWidget!),
  );
}
