import 'dart:io';

import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_appbar.dart';
import 'package:net_pro_fan/app/widget/app_loader.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/providers/theme_provider.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';

class AppPhotoView extends StatelessWidget {
  final String? url;
  final bool? isAssetImage;
  final bool? isAppbar;
  final File? fileImage;

  const AppPhotoView(
      {Key? key, this.url, this.isAssetImage = false, this.isAppbar = false, this.fileImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isAppbar!
          ? AppAppBar(
              showDrawer: false,
              showUser: false,
            )
          : AppBar(
              toolbarHeight: 0,
              elevation: 0,
            ),
      body: Consumer<ThemeProvider>(
        builder: (BuildContext context, ThemeProvider themeProvider, _) {
          return PhotoView(
            minScale: PhotoViewComputedScale.contained * 0.8,
            maxScale: PhotoViewComputedScale.covered * 2,
            imageProvider: (url!.contains('https'))
                ? NetworkImage(url!)
                : !isAssetImage!
                    ? FileImage(fileImage!) as ImageProvider
                    : AssetImage(url!),
            loadingBuilder: (context, event) => const Center(
                child: AppLoader(
              loaderColor: ColorConstant.appBlue,
            )),
            backgroundDecoration: BoxDecoration(
                color: themeProvider.isDarkMode
                    ? ColorConstant.appDarkBlack
                    : ColorConstant.appWhite),
          );
        },
      ),
    );
  }
}
