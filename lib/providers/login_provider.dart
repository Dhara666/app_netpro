import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/utills/app_logs.dart';
import 'package:net_pro_fan/app/utills/shared_preference.dart';
import 'package:net_pro_fan/app/widget/app_toast.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/providers/dashboard_provider.dart';
import 'package:net_pro_fan/services/analytics_service.dart';
import 'package:net_pro_fan/services/rest_service.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void validateForm(context, dashBoardProvider) {
    if (userNameController.text.isEmpty) {
      S.of(context).userNameCanNotBeEmpty.showSnackbar(context);
    } else if (passwordController.text.isEmpty) {
      S.of(context).passwordCanNotBeEmpty.showSnackbar(context);
    } else {
      if (userNameController.text.toString().trim() == 'member') {
        dashBoardProvider.goToMemberPage(context);
      } else if (userNameController.text.toString().trim() == 'convenor') {
        dashBoardProvider.goToConvenorPage();
      } else {
        authenticateUser(context,dashBoardProvider);
      }
      FocusScope.of(context).requestFocus(FocusNode());
      disposeProvider();
    }
  }

  Future<void> authenticateUser(context,DashBoardProvider dashBoardProvider) async {
    try {
      Map<String, dynamic> body = {
        "password": kDebugMode ?'xyz':passwordController.text,
        "username": kDebugMode ?'afsti@gmail.com':userNameController.text
      };
      logs('body --> $body');
      String? validateUser = await RestServices.postRestCall(context,
          endpoint: RestConstants.authenticateEndPoint, body: body);
      if (validateUser != null && validateUser.isNotEmpty) {
        Map<String, dynamic> validateUserMap = jsonDecode(validateUser);
        if (validateUserMap.isNotEmpty && validateUserMap.containsKey('token')) {
          setPrefStringValue(userToken, validateUserMap['token']);
          FirebaseAnalyticsService.firebaseLoginEvent(key: runtimeType.toString(), userName: userNameController.toString());
          S.of(context).success.showToast();
          disposeProvider();
        }
      }
    } on SocketException catch (e) {
      logs('Socket exception in authenticate user --> ${e.message}');
      e.message.showToast(isError: true);
    }
  }

  void disposeProvider() {
    userNameController.clear();
    passwordController.clear();
  }
}
