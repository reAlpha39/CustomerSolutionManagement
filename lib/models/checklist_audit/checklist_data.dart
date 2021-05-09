import 'dart:convert';

class ChecklistData {
    ChecklistData({
        this.urgensi,
        this.dampak,
        this.isNo,
        this.assessmentResult,
        this.remark,
        this.actual,
        this.target,
        this.improv,
    });

    int urgensi;
    int dampak;
    bool isNo;
    int assessmentResult;
    String remark;
    String actual;
    String target;
    String improv;

    factory ChecklistData.fromJson(String str) => ChecklistData.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ChecklistData.fromMap(Map<String, dynamic> json) => ChecklistData(
        urgensi: json["urgensi"],
        dampak: json["dampak"],
        isNo: json["isNo"],
        assessmentResult: json["assessmentResult"],
        remark: json["remark"],
        actual: json["actual"],
        target: json["target"],
        improv: json["improv"],
    );

    Map<String, dynamic> toMap() => {
        "urgensi": urgensi,
        "dampak": dampak,
        "isNo": isNo,
        "assessmentResult": assessmentResult,
        "remark": remark,
        "actual": actual,
        "target": target,
        "improv": improv,
    };
}