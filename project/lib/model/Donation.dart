import 'dart:convert';

Donation donationFromJson(String str) => Donation.fromJson(json.decode(str));

String donationToJson(Donation data) => json.encode(data.toJson());

class Donation {
    Donation({
        this.id,
        this.totalPrice,
        this.attachment,
        this.createdAt,
        this.updatedAt,
        this.userId,
        this.donationTypeId,
    });

    int id;
    int totalPrice;
    dynamic attachment;
    DateTime createdAt;
    dynamic updatedAt;
    int userId;
    int donationTypeId;

    factory Donation.fromJson(Map<String, dynamic> json) => Donation(
        id: json["id"] == null ? null : json["id"],
        totalPrice: json["total_price"] == null ? null : json["total_price"],
        attachment: json["attachment"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        userId: json["user_id"] == null ? null : json["user_id"],
        donationTypeId: json["donation_type_id"] == null ? null : json["donation_type_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "total_price": totalPrice == null ? null : totalPrice,
        "attachment": attachment,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt,
        "user_id": userId == null ? null : userId,
        "donation_type_id": donationTypeId == null ? null : donationTypeId,
    };
}
