// To parse this JSON data, do
//
//     final dataCustomer = dataCustomerFromMap(jsonString);

import 'dart:convert';

class DataCustomer {
  DataCustomer({
    this.namaCustomer,
    this.namaPerusahaan,
    this.alamatPerusahaan,
    this.misiPerusahaan,
    this.visiPerusahaan,
    this.customerSegment,
    this.tpUt,
    this.tpTrakindo,
    this.tpKobel,
    this.tpHitachi,
    this.tpSuny,
    this.tpLainnya,
    this.planBudget,
    this.problem,
    this.target,
    this.ketidakpuasan,
  });

  String namaCustomer;
  String namaPerusahaan;
  String alamatPerusahaan;
  String misiPerusahaan;
  String visiPerusahaan;
  String customerSegment;
  String tpUt;
  String tpTrakindo;
  String tpKobel;
  String tpHitachi;
  String tpSuny;
  String tpLainnya;
  String planBudget;
  String problem;
  String target;
  List<String> ketidakpuasan;

  factory DataCustomer.fromJson(String str) =>
      DataCustomer.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataCustomer.fromMap(Map<String, dynamic> json) => DataCustomer(
        namaCustomer: json["namaCustomer"],
        namaPerusahaan: json["namaPerusahaan"],
        alamatPerusahaan: json["alamatPerusahaan"],
        misiPerusahaan: json["misiPerusahaan"],
        visiPerusahaan: json["visiPerusahaan"],
        customerSegment: json["customerSegment"],
        tpUt: json["tpUT"],
        tpTrakindo: json["tpTrakindo"],
        tpKobel: json["tpKobel"],
        tpHitachi: json["tpHitachi"],
        tpSuny: json["tpSuny"],
        tpLainnya: json["tpLainnya"],
        planBudget: json["planBudget"],
        problem: json["problem"],
        target: json["target"],
        ketidakpuasan: List<String>.from(json["ketidakpuasan"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "namaCustomer": namaCustomer,
        "namaPerusahaan": namaPerusahaan,
        "alamatPerusahaan": alamatPerusahaan,
        "misiPerusahaan": misiPerusahaan,
        "visiPerusahaan": visiPerusahaan,
        "customerSegment": customerSegment,
        "tpUT": tpUt,
        "tpTrakindo": tpTrakindo,
        "tpKobel": tpKobel,
        "tpHitachi": tpHitachi,
        "tpSuny": tpSuny,
        "tpLainnya": tpLainnya,
        "planBudget": planBudget,
        "problem": problem,
        "target": target,
        "ketidakpuasan": List<dynamic>.from(ketidakpuasan.map((x) => x)),
      };
}
