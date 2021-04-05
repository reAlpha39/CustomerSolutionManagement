// To parse this JSON data, do
//
//     final otherProgram = otherProgramFromMap(jsonString);

import 'dart:convert';

import 'mspp_data.dart';

class OtherProgram {
    OtherProgram({
        this.people,
        this.vm,
        this.regM,
    });

    MsppData people;
    MsppData vm;
    MsppData regM;

    factory OtherProgram.fromJson(String str) => OtherProgram.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory OtherProgram.fromMap(Map<String, dynamic> json) => OtherProgram(
        people: MsppData.fromMap(json["people"]),
        vm: MsppData.fromMap(json["vm"]),
        regM: MsppData.fromMap(json["regM"]),
    );

    Map<String, dynamic> toMap() => {
        "people": people.toMap(),
        "vm": vm.toMap(),
        "regM": regM.toMap(),
    };
}