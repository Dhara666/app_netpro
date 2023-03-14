import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_header_view.dart';
import 'package:net_pro_fan/app/widget/app_photo_view.dart';
import 'package:net_pro_fan/constant/app_asset.dart';
import 'package:net_pro_fan/generated/l10n.dart';

class NetProFanChaptersPage extends StatelessWidget {
  const NetProFanChaptersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:  [
        const AppPhotoView(isAssetImage: true, url: AppAsset.mapImage),
        AppHeaderView(title: S.of(context).chapters.toUpperCase()),
      ],
    );
  }
}
