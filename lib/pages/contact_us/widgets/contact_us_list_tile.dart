import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/utills/app_logs.dart';
import 'package:net_pro_fan/app/widget/app_image_assets.dart';
import 'package:net_pro_fan/app/widget/app_text.dart';
import 'package:net_pro_fan/constant/app_asset.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/model/contact_us_model.dart';
import 'package:net_pro_fan/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsListTile extends StatelessWidget {
  final List<ContactUsModel> contactUsModel;

  const ContactUsListTile({Key? key, required this.contactUsModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (BuildContext context, ThemeProvider themeProvider, _) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          primary: true,
          itemCount: contactUsModel.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: contactUsModel[index].subTitle == null
                ? () {}
                : () => contactUsModel[index]
                    .link!
                    .urlLauncher(mode: LaunchMode.externalApplication),
            child: Container(
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration:
                    ColorConstant.appDecoration(themeProvider.isDarkMode),
                child: Row(
                  children: [
                    Container(
                        height: 30,
                        width: 10,
                        margin: const EdgeInsets.only(left: 8, right: 20),
                        child: Icon(contactUsModel[index].icon,
                            color: themeProvider.isDarkMode
                                ? ColorConstant.appWhite
                                : ColorConstant.appBlack.withOpacity(0.7))),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                              text: contactUsModel[index].title,
                              textStyle: Theme.of(context).textTheme.subtitle1),
                          const SizedBox(
                            height: 5,
                          ),
                          contactUsModel[index].subTitle == null
                              ? Container(
                                  margin: const EdgeInsets.only(top: 3),
                                  child: Row(
                                    children: [
                                      imageView(
                                        image: AppAsset.facebookIcon,
                                        onTap: () => contactUsModel[index]
                                            .link!
                                            .split(',')[0]
                                            .trim()
                                            .urlLauncher(),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      imageView(
                                        image: AppAsset.twitterIcon,
                                        onTap: () => contactUsModel[index]
                                            .link!
                                            .split(',')[1]
                                            .trim()
                                            .urlLauncher(),
                                      ),
                                    ],
                                  ),
                                )
                              : AppText(
                                  text: contactUsModel[index].subTitle,
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(fontSize: 10),
                                ),
                        ],
                      ),
                    )
                  ],
                )),
          ),
        );
      },
    );
  }

  GestureDetector imageView({String? image, GestureTapCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 18,
          width: 18,
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: ColorConstant.appBlue,
              borderRadius: BorderRadius.circular(4)),
          child: AppImageAsset(
              image: image, color: ColorConstant.appWhite, fit: BoxFit.cover)),
    );
  }
}
