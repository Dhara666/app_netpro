import 'dart:convert';
import 'package:net_pro_fan/app/utills/app_logs.dart';

AddConvenorActivityModel addConvenorActivityModelFromJson(String str) =>
    AddConvenorActivityModel.fromJson(json.decode(str));

String addConvenorActivityModelToJson(AddConvenorActivityModel data) =>
    json.encode(data.toJson());

class AddConvenorActivityModel {
  AddConvenorActivityModel({
    this.selectedActivityType,
    this.activityName,
    this.activityPerformedDate,
    this.involvedMemberNumber,
    this.activityLevel,
    this.involvedMemberName,
    this.document,
    this.addActivityTableStatus,
  });

  String? selectedActivityType;
  String? activityName;
  String? activityPerformedDate;
  String? involvedMemberNumber;
  String? activityLevel;
  String? involvedMemberName;
  String? document;
  String? addActivityTableStatus;

  factory AddConvenorActivityModel.fromJson(Map<String, dynamic> json) =>
      AddConvenorActivityModel(
        selectedActivityType: json["selectedActivityType"],
        activityName: json["activityName"],
        activityPerformedDate: json["activityPerformedDate"],
        involvedMemberNumber: json["involvedMemberNumber"],
        activityLevel: json["activityLevel"],
        involvedMemberName: json["involvedMemberName"],
        document: json["document"],
        addActivityTableStatus:
            json["addActivityTableStatus"] ?? ServerDataStatus.initial.name,
      );

  Map<String, dynamic> toJson() => {
        "selectedActivityType": selectedActivityType,
        "activityName": activityName,
        "activityPerformedDate": activityPerformedDate,
        "involvedMemberNumber": involvedMemberNumber,
        "activityLevel": activityLevel,
        "involvedMemberName": involvedMemberName,
        "document": document,
        "addActivityTableStatus":
            addActivityTableStatus ?? ServerDataStatus.initial.name,
      };
}
