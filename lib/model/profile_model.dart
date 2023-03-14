import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    this.name,
    this.email,
    this.organization,
    this.totalScore,
  });

  String?name;
  String?email;
  String?organization;
  int? totalScore;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        name: json["name"],
        email: json["email"],
        organization: json["organization"],
        totalScore: json["totalScore"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "organization": organization,
        "totalScore": totalScore,
      };
}
