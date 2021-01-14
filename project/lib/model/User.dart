import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        this.name,
        this.email,
        this.updatedAt,
        this.createdAt,
        this.id,
        this.apiToken,
    });

    String name;
    String email;
    DateTime updatedAt;
    DateTime createdAt;
    int id;
    String apiToken;

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        id: json["id"] == null ? null : json["id"],
        apiToken: json["api_token"] == null ? null : json["api_token"],
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "id": id == null ? null : id,
        "api_token": apiToken == null ? null : apiToken,
    };
}