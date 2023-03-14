// To parse this JSON data, do
//
//     final assoiciationMemberModel = assoiciationMemberModelFromJson(jsonString);

import 'dart:convert';

List<AssoiciationMemberModel> assoiciationMemberModelFromJson(String str) => List<AssoiciationMemberModel>.from(json.decode(str).map((x) => AssoiciationMemberModel.fromJson(x)));

String assoiciationMemberModelToJson(List<AssoiciationMemberModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AssoiciationMemberModel {
  AssoiciationMemberModel({
    this.serialNumber,
    this.memberId,
    this.memberName,
    this.memberState,
    this.memberCityName,
    this.memberContactNum,
    this.memberEmail,
    this.orgDetails,
    this.comments,
    this.memberStatus,
    this.typeMember,
    this.typeConvener,
    this.typeCoConvener,
    this.createdBy,
    this.createdDate,
    this.updatedBy,
    this.updatedDate,
    this.activeInd,
    this.isActive,
    this.registeredBy,
    this.memberOccupiedStatus,
    this.occupiedBy,
    this.actionRemoveMember,
    this.deleteMemberFromAssociation,
    this.deleteRemarks,
  });

  num? serialNumber;
  num? memberId;
  String? memberName;
  String? memberState;
  String? memberCityName;
  String? memberContactNum;
  String? memberEmail;
  dynamic orgDetails;
  dynamic comments;
  String? memberStatus;
  String? typeMember;
  String? typeConvener;
  String? typeCoConvener;
  dynamic createdBy;
  dynamic createdDate;
  dynamic updatedBy;
  dynamic updatedDate;
  bool? activeInd;
  String? isActive;
  String? registeredBy;
  String? memberOccupiedStatus;
  String? occupiedBy;
  bool? actionRemoveMember;
  bool? deleteMemberFromAssociation;
  dynamic deleteRemarks;

  factory AssoiciationMemberModel.fromJson(Map<String, dynamic> json) => AssoiciationMemberModel(
    serialNumber: json["serialNumber"],
    memberId: json["memberId"],
    memberName: json["memberName"],
    memberState: json["memberState"],
    memberCityName: json["memberCityName"],
    memberContactNum: json["memberContactNum"],
    memberEmail: json["memberEmail"],
    orgDetails: json["orgDetails"],
    comments: json["comments"],
    memberStatus: json["memberStatus"],
    typeMember: json["typeMember"],
    typeConvener: json["typeConvener"],
    typeCoConvener: json["typeCoConvener"],
    createdBy: json["createdBy"],
    createdDate: json["createdDate"],
    updatedBy: json["updatedBy"],
    updatedDate: json["updatedDate"],
    activeInd: json["activeInd"],
    isActive: json["isActive"],
    registeredBy: json["registeredBy"],
    memberOccupiedStatus: json["memberOccupiedStatus"],
    occupiedBy: json["occupiedBy"],
    actionRemoveMember: json["actionRemoveMember"],
    deleteMemberFromAssociation: json["deleteMemberFromAssociation"],
    deleteRemarks: json["deleteRemarks"],
  );

  Map<String, dynamic> toJson() => {
    "serialNumber": serialNumber,
    "memberId": memberId,
    "memberName": memberName,
    "memberState": memberState,
    "memberCityName": memberCityName,
    "memberContactNum": memberContactNum,
    "memberEmail": memberEmail,
    "orgDetails": orgDetails,
    "comments": comments,
    "memberStatus": memberStatus,
    "typeMember": typeMember,
    "typeConvener": typeConvener,
    "typeCoConvener": typeCoConvener,
    "createdBy": createdBy,
    "createdDate": createdDate,
    "updatedBy": updatedBy,
    "updatedDate": updatedDate,
    "activeInd": activeInd,
    "isActive": isActive,
    "registeredBy": registeredBy,
    "memberOccupiedStatus": memberOccupiedStatus,
    "occupiedBy": occupiedBy,
    "actionRemoveMember": actionRemoveMember,
    "deleteMemberFromAssociation": deleteMemberFromAssociation,
    "deleteRemarks": deleteRemarks,
  };
}
