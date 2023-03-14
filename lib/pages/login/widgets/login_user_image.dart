import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_image_assets.dart';
import 'package:net_pro_fan/constant/app_asset.dart';

class LoginUserImage extends StatelessWidget {
  const LoginUserImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.topLeft,
      child: const AppImageAsset(
          image: AppAsset.loginUserImage,
          height: 110,
          width: 190,
          fit: BoxFit.contain),
    );
  }
}
