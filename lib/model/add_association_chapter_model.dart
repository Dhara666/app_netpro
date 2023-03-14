import 'dart:convert';

import 'package:net_pro_fan/app/utills/app_logs.dart';

AddAssociationChapterModel addAssociationChapterModelFromJson(String str) =>
    AddAssociationChapterModel.fromJson(json.decode(str));

String addAssociationChapterModelToJson(AddAssociationChapterModel data) =>
    json.encode(data.toJson());

class AddAssociationChapterModel {
  AddAssociationChapterModel({
    this.chapterName,
    this.contactNumber,
    this.email,
    this.organizationType,
    this.organizationDetail,
    this.state,
    this.city,
    this.addChapterTableStatus,
  });

  String? chapterName;
  String? contactNumber;
  String? email;
  String? organizationType;
  String? organizationDetail;
  String? state;
  String? city;
  String? addChapterTableStatus;

  factory AddAssociationChapterModel.fromJson(Map<String, dynamic> json) =>
      AddAssociationChapterModel(
        chapterName: json["chapterName"],
        contactNumber: json["contactNumber"],
        email: json["email"],
        organizationType: json["organizationType"],
        organizationDetail: json["organizationDetail"],
        state: json["state"],
        city: json["city"],
        addChapterTableStatus:
            json["addChapterTableStatus"] ?? ServerDataStatus.initial.name,
      );

  Map<String, dynamic> toJson() => {
        "chapterName": chapterName,
        "contactNumber": contactNumber,
        "email": email,
        "organizationType": organizationType,
        "organizationDetail": organizationDetail,
        "state": state,
        "city": city,
        "addChapterTableStatus":
            addChapterTableStatus ?? ServerDataStatus.initial.name,
      };
}
