import 'dart:convert';

List<List<String>> stateModelFromJson(String str) => List<List<String>>.from(json.decode(str).map((x) => List<String>.from(x.map((x) => x))));

String stateModelToJson(List<List<String>> data) => json.encode(List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x)))));
