import 'dart:convert';

import 'package:customer/models/checklist_audit/checklist_audit.dart';

class ListChecklistAudit {
  ListChecklistAudit({
    this.checklistAudit,
  });

  List<ChecklistAudit>? checklistAudit;

  factory ListChecklistAudit.fromJson(String str) =>
      ListChecklistAudit.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListChecklistAudit.fromMap(Map<String, dynamic> json) =>
      ListChecklistAudit(
        checklistAudit: List<ChecklistAudit>.from(
            json["ChecklistAudit"].map((x) => ChecklistAudit.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "ChecklistAudit":
            List<dynamic>.from(checklistAudit!.map((x) => x.toMap())),
      };
}
