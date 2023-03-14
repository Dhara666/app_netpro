import 'dart:convert';

import 'package:net_pro_fan/app/utills/app_logs.dart';

AddMemberActivityModel addMemberActivityModelFromJson(String str) =>
    AddMemberActivityModel.fromJson(json.decode(str));

String addMemberActivityModelToJson(AddMemberActivityModel data) =>
    json.encode(data.toJson());

class AddMemberActivityModel {
  AddMemberActivityModel({
    this.selectedActivityType,
    this.activityName,
    this.activityPerformedDate,
    this.activityLevel,
    this.document,
    this.addActivityTableStatus,
  });

  String? selectedActivityType;
  String? activityName;
  String? activityPerformedDate;
  String? activityLevel;
  String? document;
  String? addActivityTableStatus;

  factory AddMemberActivityModel.fromJson(Map<String, dynamic> json) =>
      AddMemberActivityModel(
        selectedActivityType: json["selectedActivityType"],
        activityName: json["activityName"],
        activityPerformedDate: json["activityPerformedDate"],
        activityLevel: json["activityLevel"],
        document: json["document"],
        addActivityTableStatus:
            json["addActivityTableStatus"] ?? ServerDataStatus.initial.name,
      );

  Map<String, dynamic> toJson() => {
        "selectedActivityType": selectedActivityType,
        "activityName": activityName,
        "activityPerformedDate": activityPerformedDate,
        "activityLevel": activityLevel,
        "document": document,
        "addActivityTableStatus":
            addActivityTableStatus ?? ServerDataStatus.initial.name,
      };
}
