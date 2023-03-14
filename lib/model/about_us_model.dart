import 'dart:convert';

List<AboutUsModel> aboutUsModelFromJson(String str) => List<AboutUsModel>.from(
    json.decode(str).map((x) => AboutUsModel.fromJson(x)));

String aboutUsModelToJson(List<AboutUsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AboutUsModel {
  AboutUsModel({
    this.title,
    this.subTitle,
    this.content,
  });

  String? title;
  String? subTitle;
  List<String>? content;

  factory AboutUsModel.fromJson(Map<String, dynamic> json) => AboutUsModel(
        title: json["title"],
        subTitle: json["subTitle"],
        content: List<String>.from(json["content"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subTitle": subTitle,
        "content": List<dynamic>.from(content!.map((x) => x)),
      };
}
