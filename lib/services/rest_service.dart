import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:net_pro_fan/app/utills/app_logs.dart';
import 'package:net_pro_fan/app/utills/shared_preference.dart';

class RestConstants {
  static String? baseUrl;
  static String authToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZnN0aUBnbWFpbC5jb20iLCJleHAiOjE2NjExOTQ2NDgsImlhdCI6MTY2MTE1ODY0OH0.BSkZQ3iPSTjy6E4hfJZRQOqIhl99Kf8eEAHKZbxgXho';
  static String authenticateEndPoint = 'authenticate';
  static String checkUniqueEmailEndPoint = 'common/checkUniqueEmailIdForAssociationMember';
  static String associationMyChapterEndPoint =
      'dashboard/associationDashboardMyChapters';
  static String associationOnGoingChaptersEndPoint =
      'dashboard/associationDashboardOnGoingChapters';
  static String associationAllChaptersEndPoint = 'dashboard/allChapters';
  static String associationAddMemberEndPoint = 'member/addMember';
  static String associationViewMemberEndPoint = 'member/allMembersByAssociation';
  static String allStateEndPoint = 'common/allStateList';
  static String allCityEndPoint = 'common/getDistrictByState?stateCode=';
}

class RestServices {
  static Map<String, String> headers = {'Accept': 'application/json'};

  static void showRequestAndResponseLogs(
      http.Response? response, Map<String, Object> requestData) {
    logs(':::::::::: Network logs :::::::::: ');
    logs('request url -> ${response?.request?.url}');
    logs('request headers -> $requestData');
    logs('status code -> ${response?.statusCode}');
    logs('response headers -> ${response?.headers}');
    logs('response body -> ${response?.body}');
    logs('::::::::::::::::::::::::::::::::::');
  }

  static getRestCall(BuildContext context, {required String? endpoint, String? addOns}) async {
    String? responseData;
    bool connected = await isConnectNetworkWithMessage(context);
    if (!connected) {
      return responseData;
    }
    String? token = await getPrefStringValue(userToken);
    if (token != null && token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
    }
    try {
      String requestUrl = addOns != null
          ? '${RestConstants.baseUrl}/$endpoint$addOns'
          : '${RestConstants.baseUrl}/$endpoint';
      Uri? requestedUri = Uri.tryParse(requestUrl);

      Response response = (token != null && token.isNotEmpty)
          ? await http.get(requestedUri!, headers: headers)
          : await http.get(requestedUri!);

      showRequestAndResponseLogs(response, headers);

      switch (response.statusCode) {
        case 200:
        case 201:
          responseData = response.body;
          break;
        case 400:
        case 404:
        case 500:
          logs('${response.statusCode}');
          break;
        case 401:
          logs('401 : ${response.body}');
          break;
        default:
          logs('${response.statusCode} : ${response.body}');
          break;
      }
    } on PlatformException catch (e) {
      logs('PlatformException in getRestCall --> ${e.message}');
    }
    return responseData;
  }

  static postRestCall(BuildContext context, {required String? endpoint, required Map<String, dynamic>? body, String? addOns}) async {
    String? responseData;
    bool connected = await isConnectNetworkWithMessage(context);
    if (!connected) {
      return responseData;
    }
    String? token = await getPrefStringValue(userToken);
    if (token != null && token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
    }
    try {
      String requestUrl = addOns != null
          ? '${RestConstants.baseUrl}/$endpoint/$addOns'
          : '${RestConstants.baseUrl}/$endpoint';
      Uri? requestedUri = Uri.tryParse(requestUrl);

      Response response = await http.post(requestedUri!,
          body: jsonEncode(body),
          headers: {'Content-Type': 'application/json'});

      showRequestAndResponseLogs(response, headers);

      switch (response.statusCode) {
        case 200:
        case 201:
          responseData = response.body;
          break;
        case 500:
        case 400:
        case 404:
          logs('${response.statusCode}');
          break;
        case 401:
          logs('401 : ${response.body}');
          break;
        default:
          logs('${response.statusCode} : ${response.body}');
          break;
      }
    } on PlatformException catch (e) {
      logs('PlatformException in postRestCall --> ${e.message}');
    }
    return responseData;
  }

  static multiPartRestCall(
    BuildContext context, {
    required String? endpoint,
    required Map<String, String>? body,
    String? keyName,
    String? fileName,
  }) async {
    String? responseData;
    bool connected = await isConnectNetworkWithMessage(context);
    if (!connected) {
      return responseData;
    }
    try {
      String requestUrl = '${RestConstants.baseUrl}/$endpoint';
      Uri? requestedUri = Uri.tryParse(requestUrl);

      String? token = await getPrefStringValue(userToken);
      if (token != null && token.isNotEmpty) {
        headers['Authorization'] = 'Bearer $token';
      }
      MultipartRequest request = http.MultipartRequest('POST', requestedUri!);
      request.headers.addAll(headers);
      if (body!.isNotEmpty) {
        request.fields.addAll(body);
      }
      if(keyName != null) request.files.add(await http.MultipartFile.fromPath(keyName, fileName!));
      StreamedResponse responseStream = await request.send();
      final response = await http.Response.fromStream(responseStream);

      showRequestAndResponseLogs(response, headers);

      switch (response.statusCode) {
        case 200:
        case 201:
          responseData = response.body;
          break;
        case 500:
        case 400:
        case 404:
          logs('${response.statusCode}');
          break;
        case 401:
          logs('401 : ${response.body}');
          break;
        default:
          logs('${response.statusCode} : ${response.body}');
          break;
      }
    } on PlatformException catch (e) {
      logs('PlatformException in multiPartRestCall --> ${e.message}');
    }
    return responseData;
  }

  static deleteRestCall(BuildContext context,
      {required String? endpoint,
      required Map<String, dynamic>? body,
      String? addOns}) async {
    String? responseData;
    bool connected = await isConnectNetworkWithMessage(context);
    if (!connected) {
      return responseData;
    }
    try {
      String requestUrl = addOns != null
          ? '${RestConstants.baseUrl}/$endpoint/$addOns'
          : '${RestConstants.baseUrl}/$endpoint';
      Uri? requestedUri = Uri.tryParse(requestUrl);

      Response response =
          await http.delete(requestedUri!, headers: headers, body: body);

      showRequestAndResponseLogs(response, headers);

      switch (response.statusCode) {
        case 200:
        case 201:
          responseData = response.body;
          break;
        case 500:
        case 400:
        case 404:
          logs('${response.statusCode}');
          break;
        case 401:
          logs('401 : ${response.body}');
          break;
        default:
          logs('${response.statusCode} : ${response.body}');
          break;
      }
    } on PlatformException catch (e) {
      logs('PlatformException in deleteRestCall --> ${e.message}');
    }
    return responseData;
  }

  static patchRestCall(BuildContext context,
      {required String? endpoint,
      required Map<String, dynamic>? body,
      String? addOns}) async {
    String? responseData;
    bool connected = await isConnectNetworkWithMessage(context);
    if (!connected) {
      return responseData;
    }
    try {
      String requestUrl = addOns != null
          ? '${RestConstants.baseUrl}/$endpoint/$addOns'
          : '${RestConstants.baseUrl}/$endpoint';
      Uri? requestedUri = Uri.tryParse(requestUrl);

      Response response =
          await http.patch(requestedUri!, headers: headers, body: body);

      showRequestAndResponseLogs(response, headers);

      switch (response.statusCode) {
        case 200:
        case 201:
          responseData = response.body;
          break;
        case 500:
        case 400:
        case 404:
          logs('${response.statusCode}');
          break;
        case 401:
          logs('401 : ${response.body}');
          break;
        default:
          logs('${response.statusCode} : ${response.body}');
          break;
      }
    } on PlatformException catch (e) {
      logs('PlatformException in patchRestCall --> ${e.message}');
    }
    return responseData;
  }
}
