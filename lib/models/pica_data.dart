// To parse this JSON data, do
//
//     final picaData = picaDataFromMap(jsonString);

import 'dart:convert';

class PicaData {
    PicaData({
        this.listPica,
    });

    List<List<dynamic>> listPica;

    factory PicaData.fromJson(String str) => PicaData.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PicaData.fromMap(Map<String, dynamic> json) => PicaData(
        listPica: List<List<dynamic>>.from(json["listPica"].map((x) => List<dynamic>.from(x.map((x) => x)))),
    );

    Map<String, dynamic> toMap() => {
        "listPica": List<dynamic>.from(listPica.map((x) => List<dynamic>.from(x.map((x) => x)))),
    };
}
