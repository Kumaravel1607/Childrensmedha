// To parse this JSON data, do
//
//     final stateModel = stateModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<StateModel> stateModelFromJson(String str) =>
    List<StateModel>.from(json.decode(str).map((x) => StateModel.fromJson(x)));

String stateModelToJson(List<StateModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StateModel {
  final int id;
  final String stateCode;
  final String stateName;
  final At createdAt;
  final At updateAt;

  StateModel({
    required this.id,
    required this.stateCode,
    required this.stateName,
    required this.createdAt,
    required this.updateAt,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
        id: json["id"],
        stateCode: json["state_code"],
        stateName: json["state_name"],
        createdAt: atValues.map[json["created_at"]]!,
        updateAt: atValues.map[json["update_at"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "state_code": stateCode,
        "state_name": stateName,
        "created_at": atValues.reverse[createdAt],
        "update_at": atValues.reverse[updateAt],
      };
}

enum At { THE_00000000000000 }

final atValues = EnumValues({"0000-00-00 00:00:00": At.THE_00000000000000});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
