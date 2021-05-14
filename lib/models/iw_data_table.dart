// To parse this JSON data, do
//
//     final iwDataTable = iwDataTableFromMap(jsonString);

import 'dart:convert';

class IwDataTable {
  IwDataTable({
    this.id,
    this.dimension,
    this.element,
    this.description,
    this.noKlausul,
  });

  List<int>? id;
  List<String>? dimension;
  List<String>? element;
  List<String>? description;
  List<String>? noKlausul;

  factory IwDataTable.fromJson(String str) =>
      IwDataTable.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory IwDataTable.fromMap(Map<String, dynamic> json) => IwDataTable(
        id: List<int>.from(json["id"].map((x) => x)),
        dimension: List<String>.from(json["dimension"].map((x) => x)),
        element: List<String>.from(json["element"].map((x) => x)),
        description: List<String>.from(json["description"].map((x) => x)),
        noKlausul: List<String>.from(json["noKlause"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": List<dynamic>.from(id!.map((x) => x)),
        "dimension": List<dynamic>.from(dimension!.map((x) => x)),
        "element": List<dynamic>.from(element!.map((x) => x)),
        "description": List<dynamic>.from(description!.map((x) => x)),
        "noKlause": List<dynamic>.from(noKlausul!.map((x) => x)),
      };
}
