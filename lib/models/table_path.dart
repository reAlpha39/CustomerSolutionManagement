import 'dart:convert';

class TablePath {
    TablePath({
        this.documentA,
        this.collectionA,
        this.documentB,
    });

    String documentA;
    String collectionA;
    String documentB;

    factory TablePath.fromJson(String str) => TablePath.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TablePath.fromMap(Map<String, dynamic> json) => TablePath(
        documentA: json["documentA"],
        collectionA: json["collectionA"],
        documentB: json["documentB"],
    );

    Map<String, dynamic> toMap() => {
        "documentA": documentA,
        "collectionA": collectionA,
        "documentB": documentB,
    };
}
