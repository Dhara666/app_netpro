import 'dart:convert';

MemberActivityPerformedModel memberActivityPerformedModelFromJson(String str) =>
    MemberActivityPerformedModel.fromJson(json.decode(str));

String memberActivityPerformedModelToJson(MemberActivityPerformedModel data) =>
    json.encode(data.toJson());

class MemberActivityPerformedModel {
  MemberActivityPerformedModel({
    this.slNo,
    this.activityCategory,
    this.activityName,
    this.status,
    this.eventDate,
  });

  int? slNo;
  String? activityCategory;
  String? activityName;
  String? status;
  String? eventDate;

  factory MemberActivityPerformedModel.fromJson(Map<String, dynamic> json) =>
      MemberActivityPerformedModel(
        slNo: json["slNo"],
        activityCategory: json["activityCategory"],
        activityName: json["activityName"],
        status: json["status"],
        eventDate: json["eventDate"],
      );

  Map<String, dynamic> toJson() => {
        "slNo": slNo,
        "activityCategory": activityCategory,
        "activityName": activityName,
        "status": status,
        "eventDate": eventDate,
      };
}
