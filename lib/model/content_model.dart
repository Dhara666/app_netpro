import 'dart:convert';

import 'package:flutter/material.dart';

List<ContentModel> eventsModelFromJson(String str) => List<ContentModel>.from(json.decode(str).map((x) => ContentModel.fromJson(x)));

String eventsModelToJson(List<ContentModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ContentModel {
  ContentModel({
    this.title,
    this.image,
    this.link,
  });

  @required String? title;
  String? image;
  String? link;

  factory ContentModel.fromJson(Map<String, dynamic> json) => ContentModel(
    title: json["title"],
    image: json["image"],
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "image": image,
    "link": link,
  };
}
