import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_text.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/pages/home/widgets/home_page_list_tile.dart';
import 'package:net_pro_fan/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class HomeContactUsView extends StatelessWidget {
  const HomeContactUsView({Key? key}) : super(key: key);

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
                text: S.of(context).contactUs.toUpperCase(),
                textStyle: Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.w700, color: ColorConstant.appWhite),
              ),
              const Divider(
                color: ColorConstant.appYellow,
                thickness: 1,
              ),
              HomePageListTile(
                  title: S.of(context).addressInformation,
                  leadingIcon: Icons.location_on_outlined,
                  subTitle: 'FDA Bhawan, Kotla Road, New Delhi',
                  link: "https://www.google.com/maps/place/Food+Safety+and+Standards+Authority+of+India+(FSSAI)/@28.7880505,77.1382348,9.54z/data=!4m5!3m4!1s0x0:0xf036137df7286cd7!8m2!3d28.6324315!4d77.2353096?hl=en"),
              HomePageListTile(
                title: S.of(context).callNow,
                leadingIcon: Icons.call_outlined,
                subTitle: '011-23220994',
                link: 'tel:+011-23220994',
              ),
              HomePageListTile(
                title: S.of(context).mail,
                leadingIcon: Icons.mail_outline,
                subTitle: 'netprofan.eri@gmail.com',
                link: 'mailto:netprofan.eri@gmail.com.in?subject%20plugin',
              ),
            ],
          ),
        );
      },
    );
  }
}
