import 'dart:convert';

TopChaptersModel topChaptersModelFromJson(String str) =>
    TopChaptersModel.fromJson(json.decode(str));

String topChaptersModelToJson(TopChaptersModel data) =>
    json.encode(data.toJson());

class TopChaptersModel {
  TopChaptersModel({
    this.slNo,
    this.city,
    this.score,
  });

  int? slNo;
  String? city;
  int? score;

  factory TopChaptersModel.fromJson(Map<String, dynamic> json) =>
      TopChaptersModel(
        slNo: json["sl_no"],
        city: json["city"],
        score: json["score"],
      );

  Map<String, dynamic> toJson() => {
        "sl_no": slNo,
        "city": city,
        "score": score,
      };
}
