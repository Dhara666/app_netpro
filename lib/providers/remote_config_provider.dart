import 'dart:io';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/utills/app_logs.dart';
import 'package:net_pro_fan/app/widget/app_dialog.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/services/rest_service.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class RemoteConfigProvider extends ChangeNotifier {
  bool isUpdateAvailable = false;
  bool isSoftUpdateAvailable = false;

  Future<void> getRemoteConfigValue(BuildContext context) async {
    FirebaseRemoteConfig firebaseRemoteConfig = FirebaseRemoteConfig.instance;
    String baseUrl = firebaseRemoteConfig.getString('base_url');
    logs('Config baseurl --> $baseUrl');
    RestConstants.baseUrl = baseUrl;
    String updateType = firebaseRemoteConfig.getString('update_type');
    logs('Config update type --> $updateType');
    if(updateType != 'none'){
      num remoteAppVersion = firebaseRemoteConfig.getInt('app_version');
      logs('Config app version --> $remoteAppVersion');
      String whatsNew = firebaseRemoteConfig.getString('whats_new');
      logs('Config whats new --> $whatsNew');
      String updateLink = Platform.isAndroid
          ? firebaseRemoteConfig.getString('android_path')
          : firebaseRemoteConfig.getString('ios_path');
      logs('Config update link --> $updateLink');
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      logs('App version --> ${packageInfo.version}');
      String tmpPackageVersion = packageInfo.version.replaceAll('.', '');
      logs('Tmp Package Version --> $tmpPackageVersion');
      if (num.parse(tmpPackageVersion) < remoteAppVersion) {
        isUpdateAvailable = true;
        if (updateType == 'soft') {
          isSoftUpdateAvailable = true;
        }
        await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => WillPopScope(
            onWillPop: () async => false,
            child: AppCustomAlertDialog(
              message: 'New version available (${addDots(remoteAppVersion.toString())})',
              messageDescription: whatsNew.isEmpty ? '' : whatsNew,
              buttonTitle: "Update",
              isClose: isSoftUpdateAvailable ? true : false,
              onTap: () =>
                  updateLink.urlLauncher(mode: LaunchMode.externalApplication),
              isImage: true,
              buttonColor: ColorConstant.appRed,
            ),
          ),
        );
      }
    }
  }

  String addDots(String text) {
    const int addDotEvery = 1;
    String out = '';
    for (int i = 0; i < text.length; i++) {
      if (i + 1 > addDotEvery && i % addDotEvery == 0) {
        out += '.';
      }
      out += text[i];
    }
    return out;
  }
}
