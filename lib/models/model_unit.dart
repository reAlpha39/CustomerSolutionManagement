// To parse this JSON data, do
//
//     final modelUnit = modelUnitFromMap(jsonString);

import 'dart:convert';

class ModelUnit {
    ModelUnit({
        this.bd,
        this.gd,
        this.hd,
        this.pc,
        this.scn,
        this.wa,
        this.tdn,
        this.bw,
    });

    List<String> bd;
    List<String> gd;
    List<String> hd;
    List<String> pc;
    List<String> scn;
    List<String> wa;
    List<String> tdn;
    List<String> bw;

    factory ModelUnit.fromJson(String str) => ModelUnit.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ModelUnit.fromMap(Map<String, dynamic> json) => ModelUnit(
        bd: List<String>.from(json["BD"].map((x) => x)),
        gd: List<String>.from(json["GD"].map((x) => x)),
        hd: List<String>.from(json["HD"].map((x) => x)),
        pc: List<String>.from(json["PC"].map((x) => x)),
        scn: List<String>.from(json["SCN"].map((x) => x)),
        wa: List<String>.from(json["WA"].map((x) => x)),
        tdn: List<String>.from(json["TDN"].map((x) => x)),
        bw: List<String>.from(json["BW"].map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "BD": List<dynamic>.from(bd.map((x) => x)),
        "GD": List<dynamic>.from(gd.map((x) => x)),
        "HD": List<dynamic>.from(hd.map((x) => x)),
        "PC": List<dynamic>.from(pc.map((x) => x)),
        "SCN": List<dynamic>.from(scn.map((x) => x)),
        "WA": List<dynamic>.from(wa.map((x) => x)),
        "TDN": List<dynamic>.from(tdn.map((x) => x)),
        "BW": List<dynamic>.from(bw.map((x) => x)),
    };
}
