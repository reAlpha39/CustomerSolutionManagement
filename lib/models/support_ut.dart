// To parse this JSON data, do
//
//     final dataCustomer = dataCustomerFromMap(jsonString);

import 'dart:convert';

import 'package:customer/models/total_product.dart';

class SupportUt {
    SupportUt({
        this.id,
        this.namaCustomer,
        this.namaPerusahaan,
        this.alamatPerusahaan,
        this.misiPerusahaan,
        this.visiPerusahaan,
        this.customerSegment,
        this.totalProduct,
        this.planBudget,
        this.problem,
        this.target,
        this.ketidakpuasan,
    });

    String id;
    String namaCustomer;
    String namaPerusahaan;
    String alamatPerusahaan;
    String misiPerusahaan;
    String visiPerusahaan;
    String customerSegment;
    TotalProduct totalProduct;
    String planBudget;
    String problem;
    String target;
    List<String> ketidakpuasan;

    factory SupportUt.fromJson(String str) => SupportUt.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory SupportUt.fromMap(Map<String, dynamic> json) => SupportUt(
        id: json["id"],
        namaCustomer: json["namaCustomer"],
        namaPerusahaan: json["namaPerusahaan"],
        alamatPerusahaan: json["alamatPerusahaan"],
        misiPerusahaan: json["misiPerusahaan"],
        visiPerusahaan: json["visiPerusahaan"],
        customerSegment: json["customerSegment"],
        totalProduct: TotalProduct.fromMap(json["totalProduct"]),
        planBudget: json["planBudget"],
        problem: json["problem"],
        target: json["target"],
        ketidakpuasan: List<String>.from(json["ketidakpuasan"].map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "namaCustomer": namaCustomer,
        "namaPerusahaan": namaPerusahaan,
        "alamatPerusahaan": alamatPerusahaan,
        "misiPerusahaan": misiPerusahaan,
        "visiPerusahaan": visiPerusahaan,
        "customerSegment": customerSegment,
        "totalProduct": totalProduct.toMap(),
        "planBudget": planBudget,
        "problem": problem,
        "target": target,
        "ketidakpuasan": List<dynamic>.from(ketidakpuasan.map((x) => x)),
    };
}