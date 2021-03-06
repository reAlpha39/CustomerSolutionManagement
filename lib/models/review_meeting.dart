// To parse this JSON data, do
//
//     final listChecklistAudit = listChecklistAuditFromMap(jsonString);

import 'dart:convert';

class ListReviewMeeting {
  ListReviewMeeting({
    this.reviewMeeting,
  });

  List<ReviewMeeting>? reviewMeeting;

  factory ListReviewMeeting.fromJson(String str) =>
      ListReviewMeeting.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListReviewMeeting.fromMap(Map<String, dynamic> json) =>
      ListReviewMeeting(
        reviewMeeting: List<ReviewMeeting>.from(
            json["review_meeting"].map((x) => ReviewMeeting.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "review_meeting":
            List<dynamic>.from(reviewMeeting!.map((x) => x.toMap())),
      };
}

class ReviewMeeting {
  ReviewMeeting({
    this.id,
    this.tanggal,
    this.nama,
    this.agenda,
    this.note,
    this.type,
    this.picture,
  });

  String? id;
  String? tanggal;
  String? nama;
  String? agenda;
  String? note;
  String? type;
  String? picture;

  factory ReviewMeeting.fromJson(String str) =>
      ReviewMeeting.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReviewMeeting.fromMap(Map<String, dynamic> json) => ReviewMeeting(
        id: json["id"],
        tanggal: json["tanggal"],
        nama: json["nama"],
        agenda: json["agenda"],
        note: json["note"],
        type: json["type"],
        picture: json["picture"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "tanggal": tanggal,
        "nama": nama,
        "agenda": agenda,
        "note": note,
        "type": type,
        "picture": picture,
      };
}
