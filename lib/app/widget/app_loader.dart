import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:net_pro_fan/constant/color_constant.dart';

class AppLoader extends StatelessWidget {
  final Color loaderColor;
  final double loaderSize;

  const AppLoader(
      {Key? key, this.loaderColor = ColorConstant.appBlue, this.loaderSize = 40})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: ColorConstant.appWhite.withOpacity(0.8),
        child: SpinKitDoubleBounce(
          color: loaderColor,
          size: loaderSize,
        ),
      ),
    );
  }
}
