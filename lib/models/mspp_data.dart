// To parse this JSON data, do
//
//     final mspp = msppFromMap(jsonString);

import 'dart:convert';

class MsppData {
    MsppData({
        this.assessmentResult,
        this.remark,
    });

    List<int> assessmentResult;
    List<String> remark;

    factory MsppData.fromJson(String str) => MsppData.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MsppData.fromMap(Map<String, dynamic> json) => MsppData(
        assessmentResult: List<int>.from(json["assessmentResult"].map((x) => x)),
        remark: List<String>.from(json["remark"].map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "assessmentResult": List<dynamic>.from(assessmentResult.map((x) => x)),
        "remark": List<dynamic>.from(remark.map((x) => x)),
    };
}
