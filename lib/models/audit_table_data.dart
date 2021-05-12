// To parse this JSON data, do
//
//     final auditTableData = auditTableDataFromMap(jsonString);

import 'dart:convert';

class AuditTableData {
  AuditTableData({
    this.id,
    this.description,
    this.guidance,
    this.noKlause,
    this.objectiveEvidence,
    this.pic,
  });

  List<int>? id;
  List<String>? description;
  List<String>? guidance;
  List<String>? noKlause;
  List<String>? objectiveEvidence;
  List<String>? pic;

  factory AuditTableData.fromJson(String str) =>
      AuditTableData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuditTableData.fromMap(Map<String, dynamic> json) => AuditTableData(
        id: List<int>.from(json["id"].map((x) => x)),
        description: List<String>.from(json["description"].map((x) => x)),
        guidance: List<String>.from(json["guidance"].map((x) => x)),
        noKlause: List<String>.from(json["noKlause"].map((x) => x)),
        objectiveEvidence:
            List<String>.from(json["objectiveEvidence"].map((x) => x)),
        pic: List<String>.from(json["pic"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": List<dynamic>.from(id!.map((x) => x)),
        "description": List<dynamic>.from(description!.map((x) => x)),
        "guidance": List<dynamic>.from(guidance!.map((x) => x)),
        "noKlause": List<dynamic>.from(noKlause!.map((x) => x)),
        "objectiveEvidence":
            List<dynamic>.from(objectiveEvidence!.map((x) => x)),
        "pic": List<dynamic>.from(pic!.map((x) => x)),
      };
}
