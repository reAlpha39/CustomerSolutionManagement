// To parse this JSON data, do
//
//     final picaData = picaDataFromMap(jsonString);

import 'dart:convert';

import 'package:customer/models/pica_element.dart';

class PicaData {
    PicaData({
        this.picaElement,
    });

    List<PicaElement> picaElement;

    factory PicaData.fromJson(String str) => PicaData.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PicaData.fromMap(Map<String, dynamic> json) => PicaData(
        picaElement: List<PicaElement>.from(json["picaElement"].map((x) => PicaElement.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "picaElement": List<dynamic>.from(picaElement.map((x) => x.toMap())),
    };
}