import 'dart:convert';

MemberModel memberModelFromJson(String str) =>
    MemberModel.fromJson(json.decode(str));

String memberModelToJson(MemberModel data) => json.encode(data.toJson());

class MemberModel {
  MemberModel({
    this.slNo,
    this.name,
    this.email,
    this.organization,
    this.professionalAssociation,
    this.action,
  });

  int? slNo;
  String? name;
  String? email;
  String? organization;
  String? professionalAssociation;
  String? action;

  factory MemberModel.fromJson(Map<String, dynamic> json) => MemberModel(
        slNo: json["sl_no"],
        name: json["name"],
        email: json["email"],
        organization: json["organization"],
        professionalAssociation: json["professional_association"],
        action: json["action"],
      );

  Map<String, dynamic> toJson() => {
        "sl_no": slNo,
        "name": name,
        "email": email,
        "organization": organization,
        "professional_association": professionalAssociation,
        "action": action,
      };
}
