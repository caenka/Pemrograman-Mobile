import 'dart:convert';

Good goodFromJson(String str) => Good.fromJson(json.decode(str));

String goodToJson(Good data) => json.encode(data.toJson());

class Good {
    Good({
        this.id,
        this.name,
        this.photo,
        this.price,
        this.type,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String name;
    String photo;
    int price;
    String type;
    DateTime createdAt;
    dynamic updatedAt;

    factory Good.fromJson(Map<String, dynamic> json) => Good(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        photo: json["photo"] == null ? null : json["photo"],
        price: json["price"] == null ? null : json["price"],
        type: json["type"] == null ? null : json["type"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "photo": photo == null ? null : photo,
        "price": price == null ? null : price,
        "type": type == null ? null : type,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt,
    };

    @override
    String toString() => name;
}
