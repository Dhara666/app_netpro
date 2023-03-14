import 'dart:io';
import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/utills/app_logs.dart';
import 'package:net_pro_fan/model/city_model.dart';
import 'package:net_pro_fan/model/state_model.dart';
import 'package:net_pro_fan/services/rest_service.dart';

class LocalDataProvider extends ChangeNotifier {
  List<List<String>> statesList = [];
  List<String> stateList = [];
  List<String> cityList = [];

  Future<void> getState(context) async {
    try {
      stateList.clear();
      statesList.clear();
      String? getState = await RestServices.getRestCall(context, endpoint: RestConstants.allStateEndPoint,);
      if (getState != null && getState.isNotEmpty) {
        logs('getState -->>$getState');
        statesList = stateModelFromJson(getState);
        for (var element in statesList) {
          stateList.add(element.last);
        }
      }
    } on SocketException catch (e) {
      logs('Catch exception getState -->> ${e.message}');
    }
    notifyListeners();
  }

  Future<void> getCity(context, String addOns) async {
    try {
      cityList.clear();
      String? getCity = await RestServices.getRestCall(context, endpoint: RestConstants.allCityEndPoint, addOns: addOns);
      if (getCity != null && getCity.isNotEmpty) {
        logs('getCity -->>$getCity');
        List<CityModel> cityModel = cityModelFromJson(getCity);
        for (var element in cityModel) {
          cityList.add(element.districtName!);
        }
      }
    } on SocketException catch (e) {
      logs('Catch exception getCity -->> ${e.message}');
    }
    notifyListeners();
  }
}
