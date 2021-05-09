import 'dart:convert';

import 'package:customer/models/checklist_audit/checklist_element.dart';

class ChecklistAudit {
    ChecklistAudit({
        this.id,
        this.title,
        this.score,
        this.part,
        this.checklistElement,
    });

    String id;
    String title;
    int score;
    String part;
    List<ChecklistElement> checklistElement;

    factory ChecklistAudit.fromJson(String str) => ChecklistAudit.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ChecklistAudit.fromMap(Map<String, dynamic> json) => ChecklistAudit(
        id: json["id"],
        title: json["title"],
        score: json["score"],
        part: json["part"],
        checklistElement: json["checklistElement"] == null ? null : List<ChecklistElement>.from(json["checklistElement"].map((x) => ChecklistElement.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "score": score,
        "part": part,
        // "checklistElement": checklistElement == null ? null : List<dynamic>.from(checklistElement.map((x) => x.toMap())),
    };
}
