import 'dart:convert';

import 'mspp_data.dart';

class PartProgram {
  PartProgram({
    this.iw,
    this.op,
  });

  Map<String, MsppData> iw;
  Map<String, MsppData> op;

  factory PartProgram.fromJson(String str) =>
      PartProgram.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PartProgram.fromMap(Map<String, dynamic> json) => PartProgram(
        iw: Map.from(json["iw"])
            .map((k, v) => MapEntry<String, MsppData>(k, MsppData.fromMap(v))),
        op: Map.from(json["op"])
            .map((k, v) => MapEntry<String, MsppData>(k, MsppData.fromMap(v))),
      );

  Map<String, dynamic> toMap() => {
        "iw": Map.from(iw)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
        "op":
            Map.from(op).map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
      };
}
