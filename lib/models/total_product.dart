import 'dart:convert';

class TotalProduct {
  TotalProduct({
    this.unitedTractor,
    this.trakindo,
    this.kobelDo,
    this.hitachi,
    this.suny,
    this.lainnya,
  });

  String? unitedTractor;
  String? trakindo;
  String? kobelDo;
  String? hitachi;
  String? suny;
  String? lainnya;

  factory TotalProduct.fromJson(String str) =>
      TotalProduct.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TotalProduct.fromMap(Map<String, dynamic> json) => TotalProduct(
        unitedTractor: json["unitedTractor"],
        trakindo: json["trakindo"],
        kobelDo: json["kobelDo"],
        hitachi: json["hitachi"],
        suny: json["suny"],
        lainnya: json["lainnya"],
      );

  Map<String, dynamic> toMap() => {
        "unitedTractor": unitedTractor,
        "trakindo": trakindo,
        "kobelDo": kobelDo,
        "hitachi": hitachi,
        "suny": suny,
        "lainnya": lainnya,
      };
}
