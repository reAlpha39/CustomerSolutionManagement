// To parse this JSON data, do
//
//     final otherProgram = otherProgramFromMap(jsonString);

import 'dart:convert';

import 'mspp_data.dart';

class OtherProgram {
  OtherProgram({
    this.people,
    this.vm,
    this.regM,
  });

  Map<String, MsppData> people;
  Map<String, MsppData> vm;
  Map<String, MsppData> regM;

  factory OtherProgram.fromJson(String str) =>
      OtherProgram.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OtherProgram.fromMap(Map<String, dynamic> json) => OtherProgram(
        people: Map.from(json["people"])
            .map((k, v) => MapEntry<String, MsppData>(k, MsppData.fromMap(v))),
        vm: Map.from(json["vm"])
            .map((k, v) => MapEntry<String, MsppData>(k, MsppData.fromMap(v))),
        regM: Map.from(json["regM"])
            .map((k, v) => MapEntry<String, MsppData>(k, MsppData.fromMap(v))),
      );

  Map<String, dynamic> toMap() => {
        "people": Map.from(people)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
        "vm":
            Map.from(vm).map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
        "regM": Map.from(regM)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
      };
}
