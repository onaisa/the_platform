// To parse this JSON data, do
//
//     final usermodel = usermodelFromJson(jsonString);

import 'dart:convert';

import 'user_details_model.dart';

Usermodel usermodelFromJson(String str) => Usermodel.fromJson(json.decode(str));

String usermodelToJson(Usermodel data) => json.encode(data.toJson());

class Usermodel {
  Usermodel({
    this.user,
    this.token,
  });

  User user;
  String token;

  factory Usermodel.fromJson(Map<String, dynamic> json) => Usermodel(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        token: json["token"] == null ? null : json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user == null ? null : user.toJson(),
        "token": token == null ? null : token,
      };
}
