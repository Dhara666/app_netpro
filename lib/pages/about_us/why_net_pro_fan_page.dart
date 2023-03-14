import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_header_view.dart';
import 'package:net_pro_fan/app/widget/app_photo_view.dart';
import 'package:net_pro_fan/constant/app_asset.dart';
import 'package:net_pro_fan/generated/l10n.dart';

class WhyNetProFanPage extends StatelessWidget {
  const WhyNetProFanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        AppHeaderView(title: S.of(context).whyNetProFan),
        const Expanded(
            child: AppPhotoView(
          isAssetImage: true,
          url: AppAsset.whyNetProImage,
        )),
      ],
    );
  }
}
