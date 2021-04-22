import 'dart:convert';

class ColResult {
    ColResult({
        this.urgensi,
        this.dampak,
        this.isNo,
        this.actual,
        this.target,
        this.improv,
    });

    int urgensi;
    int dampak;
    bool isNo;
    String actual;
    String target;
    String improv;

    factory ColResult.fromJson(String str) => ColResult.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ColResult.fromMap(Map<String, dynamic> json) => ColResult(
        urgensi: json["urgensi"],
        dampak: json["dampak"],
        isNo: json["isNo"],
        actual: json["actual"],
        target: json["target"],
        improv: json["improv"],
    );

    Map<String, dynamic> toMap() => {
        "urgensi": urgensi,
        "dampak": dampak,
        "isNo": isNo,
        "actual": actual,
        "target": target,
        "improv": improv,
    };
}