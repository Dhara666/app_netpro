import 'dart:convert';

List<CityModel> cityModelFromJson(String str) => List<CityModel>.from(json.decode(str).map((x) => CityModel.fromJson(x)));

String cityModelToJson(List<CityModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CityModel {
  CityModel({
    this.districtCode,
    this.stateCode,
    this.districtName,
    this.activeflag,
  });

  num? districtCode;
  String? stateCode;
  String? districtName;
  String? activeflag;

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
    districtCode: json["districtCode"],
    stateCode: json["stateCode"],
    districtName: json["districtName"],
    activeflag: json["activeflag"],
  );

  Map<String, dynamic> toJson() => {
    "districtCode": districtCode,
    "stateCode": stateCode,
    "districtName": districtName,
    "activeflag": activeflag,
  };
}
