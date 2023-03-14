import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_button.dart';
import 'package:net_pro_fan/app/widget/app_image_assets.dart';
import 'package:net_pro_fan/constant/app_list.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/providers/dashboard_provider.dart';
import 'package:net_pro_fan/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class HomeSliderView extends StatefulWidget {
  const HomeSliderView({Key? key}) : super(key: key);

  @override
  State<HomeSliderView> createState() => _HomeSliderViewState();
}

class _HomeSliderViewState extends State<HomeSliderView> {
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (BuildContext context, ThemeProvider themeProvider, _) {
        return Container(
          height: 255,
          color: themeProvider.isDarkMode
              ? ColorConstant.appDarkBlack
              : ColorConstant.appWhite,
          child: Column(
            children: [
              AppElevatedButton(
                text: S.of(context).associatedMembers,
                height: 40,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                margin: const EdgeInsets.only(left: 15, right: 15, top: 22),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 130,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    sliderButton(
                      themeProvider: themeProvider,
                      icon: Icons.chevron_left,
                      margin: const EdgeInsets.only(right: 10),
                      onTap: () {
                        buttonCarouselController.previousPage(
                          duration: const Duration(milliseconds: 300),
                        );
                      },
                    ),
                    Expanded(
                      child: CarouselSlider(
                        carouselController: buttonCarouselController,
                        options: CarouselOptions(
                            autoPlay: true,
                            aspectRatio: 1,
                            viewportFraction: 0.35,
                            onPageChanged: (int i, _) {}),
                        items: AppList.companyLogoList.map((i) {
                                return Container(
                                  width: 100,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  alignment: Alignment.center,
                                  child: AppImageAsset(
                                    image: i,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              }).toList(),
                      ),
                    ),
                    sliderButton(
                        themeProvider: themeProvider,
                        icon: Icons.chevron_right,
                        margin: const EdgeInsets.only(left: 10),
                        onTap: () {
                          buttonCarouselController.nextPage(
                            duration: const Duration(milliseconds: 300),
                          );
                        }),
                  ],
                ),
              ),
              Consumer<DashBoardProvider>(
                builder: (BuildContext context,
                    DashBoardProvider dashBoardProvider, _) {
                  return AppElevatedButton(
                    text: S.of(context).wantToBecomeAMember,
                    height: 40,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    buttonColor: ColorConstant.appYellow,
                    onPressed: () => dashBoardProvider.goToRegister(),
                    margin:
                        const EdgeInsets.only(left: 65, right: 65, bottom: 22),
                    borderRadius: 3,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  InkWell sliderButton(
      {ThemeProvider? themeProvider,
      IconData? icon,
      GestureTapCallback? onTap,
      EdgeInsets? margin}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 22,
        width: 22,
        margin: margin,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(
          color: themeProvider!.isDarkMode
              ? ColorConstant.appWhite
              : ColorConstant.appBlack,
        )),
        child: Icon(
          icon,
          size: 20,
          color: themeProvider.isDarkMode
              ? ColorConstant.appWhite
              : ColorConstant.appBlack,
        ),
      ),
    );
  }
}
