// To parse this JSON data, do
//
//     final yearModel = yearModelFromJson(jsonString);

import 'dart:convert';

YearModel yearModelFromJson(String str) => YearModel.fromJson(json.decode(str));

String yearModelToJson(YearModel data) => json.encode(data.toJson());

class YearModel {
  YearModel({
    this.year,
    this.semesters,
  });

  Year year;
  List<Semester> semesters;

  factory YearModel.fromJson(Map<String, dynamic> json) => YearModel(
        year: json["year"] == null ? null : Year.fromJson(json["year"]),
        semesters: json["semesters"] == null
            ? null
            : List<Semester>.from(
                json["semesters"].map((x) => Semester.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "year": year == null ? null : year.toJson(),
        "semesters": semesters == null
            ? null
            : List<dynamic>.from(semesters.map((x) => x.toJson())),
      };
}

class Semester {
  Semester({
    this.id,
    this.name,
    this.photo,
    this.yearId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String photo;
  int yearId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Semester.fromJson(Map<String, dynamic> json) => Semester(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        photo: json["photo"] == null ? null : json["photo"],
        yearId: json["year_id"] == null ? null : json["year_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "photo": photo == null ? null : photo,
        "year_id": yearId == null ? null : yearId,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}

class Year {
  Year({
    this.id,
    this.name,
    this.photo,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String photo;
  DateTime createdAt;
  DateTime updatedAt;

  factory Year.fromJson(Map<String, dynamic> json) => Year(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        photo: json["photo"] == null ? null : json["photo"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "photo": photo == null ? null : photo,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}
