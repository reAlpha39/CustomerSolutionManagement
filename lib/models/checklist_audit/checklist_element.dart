import 'dart:convert';

import 'package:customer/models/checklist_audit/checklist_data.dart';
import 'package:customer/models/table_path.dart';

class ChecklistElement {
    ChecklistElement({
        this.title,
        this.id,
        this.result,
        this.tablePath,
        this.checklistData,
    });

    String title;
    String id;
    int result;
    TablePath tablePath;
    List<ChecklistData> checklistData;

    factory ChecklistElement.fromJson(String str) => ChecklistElement.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ChecklistElement.fromMap(Map<String, dynamic> json) => ChecklistElement(
        title: json["title"],
        id: json["id"],
        result: json["result"],
        tablePath: TablePath.fromMap(json["table_path"]),
        checklistData: List<ChecklistData>.from(json["checklistData"].map((x) => ChecklistData.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "title": title,
        "id": id,
        "result": result,
        "table_path": tablePath.toMap(),
        "checklistData": List<dynamic>.from(checklistData.map((x) => x.toMap())),
    };
}