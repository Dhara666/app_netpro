import 'dart:convert';
import 'package:net_pro_fan/app/utills/app_logs.dart';

AddConvenorMemberModel addMemberModelFromJson(String str) =>
    AddConvenorMemberModel.fromJson(json.decode(str));

String addConvenorMemberModelToJson(AddConvenorMemberModel data) =>
    json.encode(data.toJson());

class AddConvenorMemberModel {
  AddConvenorMemberModel({
    this.personName,
    this.contactNumber,
    this.email,
    this.confirmEmail,
    this.state,
    this.city,
    this.addMemberTableStatus,
  });

  String? personName;
  String? contactNumber;
  String? email;
  String? confirmEmail;
  String? state;
  String? city;
  String? addMemberTableStatus;

  factory AddConvenorMemberModel.fromJson(Map<String, dynamic> json) =>
      AddConvenorMemberModel(
        personName: json["personName"],
        contactNumber: json["contactNumber"],
        email: json["email"],
        confirmEmail: json["confirmEmail"],
        state: json["state"],
        city: json["city"],
        addMemberTableStatus:
            json["addMemberTableStatus"] ?? ServerDataStatus.initial.name,
      );

  Map<String, dynamic> toJson() => {
        "personName": personName,
        "contactNumber": contactNumber,
        "email": email,
        "confirmEmail": confirmEmail,
        "state": state,
        "city": city,
        "addMemberTableStatus":
            addMemberTableStatus ?? ServerDataStatus.initial.name,
      };
}
