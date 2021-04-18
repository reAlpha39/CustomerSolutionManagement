// To parse this JSON data, do
//
//     final dataTablePath = dataTablePathFromMap(jsonString);

import 'dart:convert';

import 'package:customer/models/table_path.dart';

class DataTablePath {
  DataTablePath({
    this.periodicInspection,
    this.periodicService,
    this.periodicServicePlan,
    this.ovhPlan,
    this.ovh,
    this.unscheduleBreakdown,
    this.tools,
    this.cbm,
    this.infrastructure,
    this.ketersediaanM,
    this.leadTimePP,
  });

  TablePath periodicInspection;
  TablePath periodicService;
  TablePath periodicServicePlan;
  TablePath ovhPlan;
  TablePath ovh;
  TablePath unscheduleBreakdown;
  TablePath tools;
  TablePath cbm;
  TablePath infrastructure;
  TablePath ketersediaanM;
  TablePath leadTimePP;

  factory DataTablePath.fromJson(String str) =>
      DataTablePath.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataTablePath.fromMap(Map<String, dynamic> json) => DataTablePath(
        periodicInspection: TablePath.fromMap(json["periodic_inspection"]),
        periodicService: TablePath.fromMap(json["periodic_service"]),
        periodicServicePlan: TablePath.fromMap(json["periodic_service_plan"]),
        ovhPlan: TablePath.fromMap(json["ovh_plan"]),
        ovh: TablePath.fromMap(json["ovh"]),
        unscheduleBreakdown: TablePath.fromMap(json["unscheduleBreakdown"]),
        cbm: TablePath.fromMap(json["cbm"]),
        infrastructure: TablePath.fromMap(json["infrastructure"]),
        ketersediaanM: TablePath.fromMap(json["ketersediaan_m"]),
        leadTimePP: TablePath.fromMap(json["leadTimePP"]),
      );

  Map<String, dynamic> toMap() => {
        "periodic_inspection": periodicInspection.toMap(),
        "periodic_service": periodicService.toMap(),
        "periodic_service_plan": periodicServicePlan.toMap(),
        "ovh_plan": ovhPlan.toMap(),
        "ovh": ovh.toMap(),
        "unscheduleBreakdown": unscheduleBreakdown.toMap(),
        "tools": tools.toMap(),
        "cbm": cbm.toMap(),
        "infrastructure": infrastructure.toMap(),
        "ketersediaan_m": ketersediaanM.toMap(),
        "leadTimePP": leadTimePP.toMap(),
      };
}
