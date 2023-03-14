import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_image_assets.dart';
import 'package:net_pro_fan/constant/app_asset.dart';

class HomeBackGroundView extends StatelessWidget {
  const HomeBackGroundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        AppImageAsset(
          image: AppAsset.dashboardBG,
          height: 250,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Expanded(
          child: Opacity(
            opacity: 0.6,
            child: AppImageAsset(
              image: AppAsset.dashboardFooterBack,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ],
    );
  }
}
