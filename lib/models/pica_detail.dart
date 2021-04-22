import 'dart:convert';

import 'package:customer/models/column_result.dart';
import 'package:customer/models/table_path.dart';

class PicaDetail {
    PicaDetail({
        this.title,
        this.id,
        this.tablePath,
        this.colResult,
        this.result,
    });

    String title;
    String id;
    TablePath tablePath;
    List<ColResult> colResult;
    int result;

    factory PicaDetail.fromJson(String str) => PicaDetail.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PicaDetail.fromMap(Map<String, dynamic> json) => PicaDetail(
        title: json["title"],
        id: json["id"],
        tablePath: TablePath.fromMap(json["table_path"]),
        colResult: List<ColResult>.from(json["colResult"].map((x) => ColResult.fromMap(x))),
        result: json["result"],
    );

    Map<String, dynamic> toMap() => {
        "title": title,
        "id": id,
        "table_path": tablePath.toMap(),
        "colResult": List<dynamic>.from(colResult.map((x) => x.toMap())),
        "result": result,
    };
}