import 'dart:convert';

ChapterModel chapterModelFromJson(String str) =>
    ChapterModel.fromJson(json.decode(str));

String chapterModelToJson(ChapterModel data) => json.encode(data.toJson());

class ChapterModel {
  ChapterModel({
    this.slNo,
    this.nameOfMember,
    this.chapterName,
    this.association,
    this.contact,
    this.score,
  });

  int? slNo;
  String? nameOfMember;
  String? chapterName;
  String? association;
  int? contact;
  int? score;

  factory ChapterModel.fromJson(Map<String, dynamic> json) => ChapterModel(
        slNo: json["sl_no"],
        nameOfMember: json["nameOfMember"],
        chapterName: json["chapterName"],
        association: json["association"],
        contact: json["contact"],
        score: json["score"],
      );

  Map<String, dynamic> toJson() => {
        "sl_no": slNo,
        "nameOfMember": nameOfMember,
        "chapterName": chapterName,
        "association": association,
        "contact": contact,
        "score": score,
      };
}
