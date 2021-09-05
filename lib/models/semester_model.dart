// To parse this JSON data, do
//
//     final semesterModel = semesterModelFromJson(jsonString);

import 'dart:convert';

SemesterModel semesterModelFromJson(String str) =>
    SemesterModel.fromJson(json.decode(str));

String semesterModelToJson(SemesterModel data) => json.encode(data.toJson());

class SemesterModel {
  SemesterModel({
    this.semester,
    this.courses,
  });

  Semester semester;
  List<Course> courses;

  factory SemesterModel.fromJson(Map<String, dynamic> json) => SemesterModel(
        semester: json["semester"] == null
            ? null
            : Semester.fromJson(json["semester"]),
        courses: json["courses"] == null
            ? null
            : List<Course>.from(json["courses"].map((x) => Course.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "semester": semester == null ? null : semester.toJson(),
        "courses": courses == null
            ? null
            : List<dynamic>.from(courses.map((x) => x.toJson())),
      };
}

class Course {
  Course({
    this.id,
    this.name,
    this.description,
    this.logo,
    this.semesterId,
    this.professorId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String description;
  String logo;
  int semesterId;
  int professorId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        logo: json["logo"] == null ? null : json["logo"],
        semesterId: json["semester_id"] == null ? null : json["semester_id"],
        professorId: json["professor_id"] == null ? null : json["professor_id"],
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
        "description": description == null ? null : description,
        "logo": logo == null ? null : logo,
        "semester_id": semesterId == null ? null : semesterId,
        "professor_id": professorId == null ? null : professorId,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
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
