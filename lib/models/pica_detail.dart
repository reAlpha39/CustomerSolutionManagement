import 'dart:convert';

class PicaDetail {
    PicaDetail({
        this.title,
        this.score,
        this.data,
    });

    String title;
    int score;
    List<List<dynamic>> data;

    factory PicaDetail.fromJson(String str) => PicaDetail.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PicaDetail.fromMap(Map<String, dynamic> json) => PicaDetail(
        title: json["title"],
        score: json["score"],
        data: List<List<dynamic>>.from(json["data"].map((x) => List<dynamic>.from(x.map((x) => x)))),
    );

    Map<String, dynamic> toMap() => {
        "title": title,
        "score": score,
        "data": List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x)))),
    };
}