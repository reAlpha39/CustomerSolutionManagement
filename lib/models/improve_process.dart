// To parse this JSON data, do
//
//     final improveProcess = improveProcessFromMap(jsonString);

import 'dart:convert';

class ImproveProcess {
    ImproveProcess({
        this.improveProcesData,
    });

    List<IpData> improveProcesData;

    factory ImproveProcess.fromJson(String str) => ImproveProcess.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ImproveProcess.fromMap(Map<String, dynamic> json) => ImproveProcess(
        improveProcesData: List<IpData>.from(json["improveProcesData"].map((x) => IpData.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "improveProcesData": List<dynamic>.from(improveProcesData.map((x) => x.toMap())),
    };
}

class IpData {
    IpData({
        this.matrix,
        this.model,
        this.type,
        this.descriptionBefore,
        this.descriptionAfter,
        this.picturePathBefore,
        this.picturePathAfter,
    });

    String matrix;
    String model;
    String type;
    String descriptionBefore;
    String descriptionAfter;
    String picturePathBefore;
    String picturePathAfter;

    factory IpData.fromJson(String str) => IpData.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory IpData.fromMap(Map<String, dynamic> json) => IpData(
        matrix: json["matrix"],
        model: json["model"],
        type: json["type"],
        descriptionBefore: json["descriptionBefore"],
        descriptionAfter: json["descriptionAfter"],
        picturePathBefore: json["picturePathBefore"],
        picturePathAfter: json["picturePathAfter"],
    );

    Map<String, dynamic> toMap() => {
        "matrix": matrix,
        "model": model,
        "type": type,
        "descriptionBefore": descriptionBefore,
        "descriptionAfter": descriptionAfter,
        "picturePathBefore": picturePathBefore,
        "picturePathAfter": picturePathAfter,
    };
}
