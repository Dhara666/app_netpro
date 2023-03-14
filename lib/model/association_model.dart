import 'dart:convert';

AssociationChapterModel associationChapterModelFromJson(String str) =>
    AssociationChapterModel.fromJson(json.decode(str));

String associationChapterModelToJson(AssociationChapterModel data) =>
    json.encode(data.toJson());

class AssociationChapterModel {
  AssociationChapterModel({
    this.slNo,
    this.chapterName,
    this.chapterStatus,
    this.chapterState,
    this.chapterCity,
    this.chapterCreatedBy,
    this.yourParticipationStatus,
    this.action,
  });

  int? slNo;
  String? chapterName;
  String? chapterStatus;
  String? chapterState;
  String? chapterCity;
  String? chapterCreatedBy;
  String? yourParticipationStatus;
  String? action;

  factory AssociationChapterModel.fromJson(Map<String, dynamic> json) =>
      AssociationChapterModel(
        slNo: json["slNo"],
        chapterName: json["chapterName"],
        chapterStatus: json["chapterStatus"],
        chapterState: json["chapterState"],
        chapterCity: json["chapterCity"],
        chapterCreatedBy: json["chapterCreatedBy"],
        yourParticipationStatus: json["yourParticipationStatus"],
        action: json["action"],
      );

  Map<String, dynamic> toJson() => {
        "slNo": slNo,
        "chapterName": chapterName,
        "chapterStatus": chapterStatus,
        "chapterState": chapterState,
        "chapterCity": chapterCity,
        "chapterCreatedBy": chapterCreatedBy,
        "yourParticipationStatus": yourParticipationStatus,
        "action": action,
      };
}
