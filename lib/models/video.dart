// To parse this JSON data, do
//
//     final videoModel = videoModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

VideoModel videoModelFromJson(String str) => VideoModel.fromJson(json.decode(str));

String videoModelToJson(VideoModel data) => json.encode(data.toJson());

class VideoModel {
  final String docId;
  final DateTime createdAt;
  final String videoUrl;
  final String thumbnailUrl;
  final String title;
  final String description;

  VideoModel({
    required this.docId,
    required this.createdAt,
    required this.videoUrl,
    required this.thumbnailUrl,
    required this.title,
    required this.description,
    required int views,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
    docId: json["docId"],
    createdAt: DateTime.parse(json["createdAt"]),
    videoUrl: json["videoUrl"],
    thumbnailUrl: json["thumbnailUrl"],
    title: json["title"],
    description: json["description"],
    views: 0,
  );

  Map<String, dynamic> toJson() => {
    "docId": docId,
    "createdAt": createdAt.toIso8601String(),
    "videoUrl": videoUrl,
    "thumbnailUrl": thumbnailUrl,
    "title": title,
    "description": description,
  };
  Map<String, dynamic> toMap() => {
    "docId": docId,
    "createdAt": createdAt.toIso8601String(),
    "videoUrl": videoUrl,
    "thumbnailUrl": thumbnailUrl,
    "title": title,
    "description": description,
  };
}
