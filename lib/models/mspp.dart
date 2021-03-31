// To parse this JSON data, do
//
//     final mspp = msppFromMap(jsonString);

import 'dart:convert';

import 'package:customer/models/mspp_data.dart';

class Mspp {
  Mspp({
    this.periodicInspection,
    this.periodicServicePlan,
    this.periodicService,
  });

  Map<String, MsppData> periodicInspection;
  Map<String, MsppData> periodicServicePlan;
  Map<String, MsppData> periodicService;

  factory Mspp.fromJson(String str) => Mspp.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Mspp.fromMap(Map<String, dynamic> json) => Mspp(
        periodicInspection: Map.from(json["periodicInspection"])
            .map((k, v) => MapEntry<String, MsppData>(k, MsppData.fromMap(v))),
        periodicServicePlan: Map.from(json["periodicServicePlan"])
            .map((k, v) => MapEntry<String, MsppData>(k, MsppData.fromMap(v))),
        periodicService: Map.from(json["periodicService"])
            .map((k, v) => MapEntry<String, MsppData>(k, MsppData.fromMap(v))),
      );

  Map<String, dynamic> toMap() => {
        "periodicInspection": Map.from(periodicInspection)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
        "periodicServicePlan": Map.from(periodicServicePlan)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
        "periodicService": Map.from(periodicService)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
      };
}
