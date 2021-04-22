import 'dart:convert';

import 'package:customer/models/pica_detail.dart';

class PicaElement {
    PicaElement({
        this.id,
        this.title,
        this.score,
        this.picaDetail,
    });

    String id;
    String title;
    int score;
    List<PicaDetail> picaDetail;

    factory PicaElement.fromJson(String str) => PicaElement.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PicaElement.fromMap(Map<String, dynamic> json) => PicaElement(
        id: json["id"],
        title: json["title"],
        score: json["score"],
        picaDetail: List<PicaDetail>.from(json["picaDetail"].map((x) => PicaDetail.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "score": score,
        "picaDetail": List<dynamic>.from(picaDetail.map((x) => x.toMap())),
    };
}