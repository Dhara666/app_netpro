import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_header_view.dart';
import 'package:net_pro_fan/app/widget/app_image_assets.dart';
import 'package:net_pro_fan/constant/app_asset.dart';
import 'package:net_pro_fan/constant/app_list.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/pages/about_us/widgets/about_custom_stepper.dart';
import 'package:net_pro_fan/pages/about_us/widgets/about_right_arrow_view.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppHeaderView(title: S.of(context).about.toUpperCase()),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            primary: true,
            children: [
              const AppImageAsset(
                height: 270,
                width: double.infinity,
                image: AppAsset.aboutImage1,
                fit: BoxFit.fill,
              ),
              ListView.builder(
                  itemCount: AppList.aboutList.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AboutRightArrowView(
                            title: AppList.aboutList[index].title,
                          ),
                          Expanded(
                            child: AboutCustomStepper(
                              title: AppList.aboutList[index].title,
                              contentList: AppList.aboutList[index].content,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
              const AppImageAsset(
                height: 250,
                width: double.infinity,
                image: AppAsset.aboutImage2,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
