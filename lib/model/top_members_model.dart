import 'dart:convert';

TopMembersModel topMembersModelFromJson(String str) =>
    TopMembersModel.fromJson(json.decode(str));

String topMembersModelToJson(TopMembersModel data) =>
    json.encode(data.toJson());

class TopMembersModel {
  TopMembersModel({
    this.slNo,
    this.nameOfMember,
    this.city,
    this.score,
  });

  int? slNo;
  String? nameOfMember;
  String? city;
  int? score;

  factory TopMembersModel.fromJson(Map<String, dynamic> json) =>
      TopMembersModel(
        slNo: json["sl_no"],
        nameOfMember: json["nameOfMember"],
        city: json["city"],
        score: json["score"],
      );

  Map<String, dynamic> toJson() => {
        "sl_no": slNo,
        "nameOfMember": nameOfMember,
        "city": city,
        "score": score,
      };
}
