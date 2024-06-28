// To parse this JSON data, do
//
//     final userModals = userModalsFromJson(jsonString);

import 'dart:convert';

List<UserModals> userModalsFromJson(String str) =>
    List<UserModals>.from(json.decode(str).map((x) => UserModals.fromJson(x)));

String userModalsToJson(List<UserModals> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModals {
  int userId;
  int id;
  String title;
  String body;

  UserModals({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory UserModals.fromJson(Map<String, dynamic> json) => UserModals(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
