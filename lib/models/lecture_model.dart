// To parse this JSON data, do
//
//     final lectureModel = lectureModelFromJson(jsonString);

import 'dart:convert';

LectureModel lectureModelFromJson(String str) =>
    LectureModel.fromJson(json.decode(str));

String lectureModelToJson(LectureModel data) => json.encode(data.toJson());

class LectureModel {
  LectureModel({
    this.lecture,
  });

  Lecture lecture;

  factory LectureModel.fromJson(Map<String, dynamic> json) => LectureModel(
        lecture:
            json["lecture"] == null ? null : Lecture.fromJson(json["lecture"]),
      );

  Map<String, dynamic> toJson() => {
        "lecture": lecture == null ? null : lecture.toJson(),
      };
}

class Lecture {
  Lecture({
    this.id,
    this.name,
    this.description,
    this.video,
    this.pdf,
    this.courseId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String description;
  String video;
  String pdf;
  int courseId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Lecture.fromJson(Map<String, dynamic> json) => Lecture(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        video: json["video"] == null ? null : json["video"],
        pdf: json["pdf"] == null ? null : json["pdf"],
        courseId: json["course_id"] == null ? null : json["course_id"],
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
        "video": video == null ? null : video,
        "pdf": pdf == null ? null : pdf,
        "course_id": courseId == null ? null : courseId,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}
