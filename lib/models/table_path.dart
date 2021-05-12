import 'dart:convert';

class TablePath {
    TablePath({
        this.docA,
        this.colA,
        this.docB,
    });

    String? docA;
    String? colA;
    String? docB;

    factory TablePath.fromJson(String str) => TablePath.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TablePath.fromMap(Map<String, dynamic> json) => TablePath(
        docA: json["docA"],
        colA: json["colA"],
        docB: json["docB"],
    );

    Map<String, dynamic> toMap() => {
        "docA": docA,
        "colA": colA,
        "docB": docB,
    };
}
