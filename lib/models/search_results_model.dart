// To parse this JSON data, do
//
//     final courseModel = courseModelFromJson(jsonString);

import 'dart:convert';

CourseModel courseModelFromJson(String str) =>
    CourseModel.fromJson(json.decode(str));

String courseModelToJson(CourseModel data) => json.encode(data.toJson());

class CourseModel {
  CourseModel({
    this.courses,
  });

  List<Course> courses;

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        courses: json["courses"] == null
            ? null
            : List<Course>.from(json["courses"].map((x) => Course.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
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
