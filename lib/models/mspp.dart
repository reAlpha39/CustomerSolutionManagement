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
    this.tools,
    this.infrastructur,
    this.ketersediaanMekanik,
    this.leadTimePenyelesaianP,
  });

  Map<String, MsppData> periodicInspection;
  Map<String, MsppData> periodicServicePlan;
  Map<String, MsppData> periodicService;
  Map<String, MsppData> tools;
  Map<String, MsppData> infrastructur;
  Map<String, MsppData> ketersediaanMekanik;
  Map<String, MsppData> leadTimePenyelesaianP;

  factory Mspp.fromJson(String str) => Mspp.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Mspp.fromMap(Map<String, dynamic> json) => Mspp(
        periodicInspection: Map.from(json["periodicInspection"])
            .map((k, v) => MapEntry<String, MsppData>(k, MsppData.fromMap(v))),
        periodicServicePlan: Map.from(json["periodicServicePlan"])
            .map((k, v) => MapEntry<String, MsppData>(k, MsppData.fromMap(v))),
        periodicService: Map.from(json["periodicService"])
            .map((k, v) => MapEntry<String, MsppData>(k, MsppData.fromMap(v))),
        tools: Map.from(json["tools"])
            .map((k, v) => MapEntry<String, MsppData>(k, MsppData.fromMap(v))),
        infrastructur: Map.from(json["infrastructure"])
            .map((k, v) => MapEntry<String, MsppData>(k, MsppData.fromMap(v))),
        ketersediaanMekanik: Map.from(json["ketersediaanMekanik"])
            .map((k, v) => MapEntry<String, MsppData>(k, MsppData.fromMap(v))),
        leadTimePenyelesaianP: Map.from(json["leadTimePenyelesaianP"])
            .map((k, v) => MapEntry<String, MsppData>(k, MsppData.fromMap(v))),
      );

  Map<String, dynamic> toMap() => {
        "periodicInspection": Map.from(periodicInspection)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
        "periodicServicePlan": Map.from(periodicServicePlan)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
        "periodicService": Map.from(periodicService)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
        "tools": Map.from(tools)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
        "infrastructure": Map.from(infrastructur)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
        "ketersediaanMekanik": Map.from(ketersediaanMekanik)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
        "leadTimePenyelesaianP": Map.from(leadTimePenyelesaianP)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
      };
}
