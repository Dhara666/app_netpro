// To parse this JSON data, do
//
//     final associationChaptersModel = associationChaptersModelFromJson(jsonString);

import 'dart:convert';

AssociationChaptersModel associationChaptersModelFromJson(String str) => AssociationChaptersModel.fromJson(json.decode(str));

String associationChaptersModelToJson(AssociationChaptersModel data) => json.encode(data.toJson());

class AssociationChaptersModel {
  AssociationChaptersModel({
    this.chapterModels,
    this.memberModels,
  });

  List<ChapterModel>? chapterModels;
  dynamic memberModels;

  factory AssociationChaptersModel.fromJson(Map<String, dynamic> json) => AssociationChaptersModel(
    chapterModels: List<ChapterModel>.from(json["chapterModels"].map((x) => ChapterModel.fromJson(x))),
    memberModels: json["memberModels"],
  );

  Map<String, dynamic> toJson() => {
    "chapterModels": List<dynamic>.from(chapterModels!.map((x) => x.toJson())),
    "memberModels": memberModels,
  };
}

class ChapterModel {
  ChapterModel({
    this.serialNumber,
    this.chapterId,
    this.chapterName,
    this.city,
    this.professionalAssociation,
    this.contactNumber,
    this.email,
    this.organizationDetails,
    this.organizationType,
    this.state,
    this.chapterStatus,
    this.createdBy,
    this.createdDate,
    this.updatedBy,
    this.updatedDate,
    this.memberModelList,
    this.activeInd,
    this.chapterActions,
    this.participationStatus,
    this.mobile,
  });

  num? serialNumber;
  num? chapterId;
  String? chapterName;
  String? city;
  dynamic professionalAssociation;
  String?contactNumber;
  String?email;
  String?organizationDetails;
  String?organizationType;
  String?state;
  String?chapterStatus;
  String?createdBy;
  String?createdDate;
  String?updatedBy;
  String?updatedDate;
  List<MemberModelList>? memberModelList;
  bool? activeInd;
  dynamic chapterActions;
  dynamic participationStatus;
  String? mobile;

  factory ChapterModel.fromJson(Map<String, dynamic> json) => ChapterModel(
    serialNumber: json["serialNumber"],
    chapterId: json["chapterId"],
    chapterName: json["chapterName"],
    city: json["city"],
    professionalAssociation: json["professionalAssociation"],
    contactNumber: json["contactNumber"],
    email: json["email"],
    organizationDetails: json["organizationDetails"],
    organizationType: json["organizationType"],
    state: json["state"],
    chapterStatus: json["chapterStatus"],
    createdBy: json["createdBy"],
    createdDate: json["createdDate"],
    updatedBy: json["updatedBy"],
    updatedDate: json["updatedDate"],
    memberModelList: List<MemberModelList>.from(json["memberModelList"].map((x) => MemberModelList.fromJson(x))),
    activeInd: json["activeInd"],
    chapterActions: json["chapterActions"],
    participationStatus: json["participationStatus"],
    mobile: json["mobile"],
  );

  Map<String, dynamic> toJson() => {
    "serialNumber": serialNumber,
    "chapterId": chapterId,
    "chapterName": chapterName,
    "city": city,
    "professionalAssociation": professionalAssociation,
    "contactNumber": contactNumber,
    "email": email,
    "organizationDetails": organizationDetails,
    "organizationType": organizationType,
    "state": state,
    "chapterStatus": chapterStatus,
    "createdBy": createdBy,
    "createdDate": createdDate,
    "updatedBy": updatedBy,
    "updatedDate": updatedDate,
    "memberModelList": List<dynamic>.from(memberModelList!.map((x) => x.toJson())),
    "activeInd": activeInd,
    "chapterActions": chapterActions,
    "participationStatus": participationStatus,
    "mobile": mobile,
  };
}

class MemberModelList {
  MemberModelList({
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
  });

  dynamic serialNumber;
  num? memberId;
  String? memberName;
  String? memberState;
  String? memberCityName;
  String? memberContactNum;
  String? memberEmail;
  String? orgDetails;
  String? comments;
  String? memberStatus;
  String? typeMember;
  String? typeConvener;
  String? typeCoConvener;
  String? createdBy;
  String? createdDate;
  String? updatedBy;
  String? updatedDate;
  bool? activeInd;
  dynamic isActive;

  factory MemberModelList.fromJson(Map<String, dynamic> json) => MemberModelList(
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
  };
}
