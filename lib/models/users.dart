import 'dart:convert';

class Users {
    Users({
        this.username,
        this.password,
        this.type,
    });

    String username;
    String password;
    String type;

    factory Users.fromJson(String str) => Users.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Users.fromMap(Map<String, dynamic> json) => Users(
        username: json["username"],
        password: json["password"],
        type: json["type"],
    );

    Map<String, dynamic> toMap() => {
        "username": username,
        "password": password,
        "type": type,
    };
}