import 'dart:convert';

List<ChapterActivityModel> chapterActivityModelFromJson(String str) => List<ChapterActivityModel>.from(json.decode(str).map((x) => ChapterActivityModel.fromJson(x)));

String chapterActivityModelToJson(List<ChapterActivityModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChapterActivityModel {
  ChapterActivityModel({
    this.slNo,
    this.personName,
    this.email,
    this.activityPerformed,
  });

  int? slNo;
  String? personName;
  String? email;
  String? activityPerformed;

  factory ChapterActivityModel.fromJson(Map<String, dynamic> json) => ChapterActivityModel(
    slNo: json["sl_no"],
    personName: json["personName"],
    email: json["email"],
    activityPerformed: json["activityPerformed"],
  );

  Map<String, dynamic> toJson() => {
    "sl_no": slNo,
    "personName": personName,
    "email": email,
    "activityPerformed": activityPerformed,
  };
}
