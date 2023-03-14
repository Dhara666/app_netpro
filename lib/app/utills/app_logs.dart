import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_dialog.dart';
import 'package:net_pro_fan/app/widget/app_text.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

enum ServerDataStatus { initial, uploaded }

void logs(String message) {
  if (kDebugMode) {
    print(message);
  }
}

extension UrlLaunchar on String {
  urlLauncher({LaunchMode mode = LaunchMode.inAppWebView}) async {
    logs('urlLauncher --> $this');
    Uri uri = Uri.parse(this);
    await canLaunchUrl(uri)
        ? await launchUrl(uri, mode: mode)
        : throw 'Could not launch --> $uri';
  }
}

Connectivity connectivity = Connectivity();

Future<bool> isConnectNetworkWithMessage(context,
    {bool showToast = true}) async {
  ConnectivityResult connectivityResult =
      await connectivity.checkConnectivity();
  bool isConnect = getConnectionValue(connectivityResult);
  if (!isConnect && showToast) {
    appDialog(
      context: context,
      title: S.of(context).message,
      isTitle: true,
      titleWidget: Column(
        children: <Widget>[
          Container(
            height: 50,
            width: 50,
            margin: const EdgeInsets.only(top: 30, bottom: 15),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: ColorConstant.appRed, width: 2),
            ),
          ),
          AppText(
            text: S.of(context).noInternetConnection,
          ),
          const SizedBox(height: 20)
        ],
      ),
      actionWidget: <Widget>[],
    );
  }
  return isConnect;
}

bool getConnectionValue(ConnectivityResult connectivityResult) {
  bool status = false;
  switch (connectivityResult) {
    case ConnectivityResult.mobile:
    case ConnectivityResult.wifi:
    case ConnectivityResult.ethernet:
      status = true;
      break;
    default:
      break;
  }
  return status;
}
