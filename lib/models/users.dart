import 'dart:convert';

class Users {
  Users({
    this.nama,
    this.username,
    this.password,
    this.type,
    this.level,
  });

  String? nama;
  String? username;
  String? password;
  String? type;
  String? level;

  factory Users.fromJson(String str) => Users.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Users.fromMap(Map<String, dynamic> json) => Users(
        nama: json["nama"],
        username: json["username"],
        password: json["password"],
        type: json["type"],
        level: json["level"],
      );

  Map<String, dynamic> toMap() => {
        "nama": nama,
        "username": username,
        "password": password,
        "type": type,
        "level": level,
      };
}
