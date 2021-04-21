// To parse this JSON data, do
//
//     final picaData = picaDataFromMap(jsonString);

import 'dart:convert';

import 'package:customer/models/pica_detail.dart';

class PicaData {
    PicaData({
        this.periodicInspection,
        this.periodicServicePlan,
    });

    PicaDetail periodicInspection;
    PicaDetail periodicServicePlan;

    factory PicaData.fromJson(String str) => PicaData.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PicaData.fromMap(Map<String, dynamic> json) => PicaData(
        periodicInspection: PicaDetail.fromMap(json["periodic_inspection"]),
        periodicServicePlan: PicaDetail.fromMap(json["periodic_service_plan"]),
    );

    Map<String, dynamic> toMap() => {
        "periodic_inspection": periodicInspection.toMap(),
        "periodic_service_plan": periodicServicePlan.toMap(),
    };
}