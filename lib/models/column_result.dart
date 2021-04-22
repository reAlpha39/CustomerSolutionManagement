import 'dart:convert';

class ColResult {
    ColResult({
        this.urgensi,
        this.dampak,
    });

    int urgensi;
    int dampak;

    factory ColResult.fromJson(String str) => ColResult.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ColResult.fromMap(Map<String, dynamic> json) => ColResult(
        urgensi: json["urgensi"],
        dampak: json["dampak"],
    );

    Map<String, dynamic> toMap() => {
        "urgensi": urgensi,
        "dampak": dampak,
    };
}