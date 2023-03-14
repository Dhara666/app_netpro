import 'dart:convert';

AmbassadorModel ambassadorModelFromJson(String str) =>
    AmbassadorModel.fromJson(json.decode(str));

String ambassadorModelToJson(AmbassadorModel data) =>
    json.encode(data.toJson());

class AmbassadorModel {
  AmbassadorModel({
    this.slNo,
    this.name,
    this.email,
    this.organization,
    this.action,
  });

  int? slNo;
  String? name;
  String? email;
  String? organization;
  String? action;

  factory AmbassadorModel.fromJson(Map<String, dynamic> json) =>
      AmbassadorModel(
        slNo: json["sl_no"],
        name: json["name"],
        email: json["email"],
        organization: json["organization"],
        action: json["action"],
      );

  Map<String, dynamic> toJson() => {
        "sl_no": slNo,
        "name": name,
        "email": email,
        "organization": organization,
        "action": action,
      };
}
