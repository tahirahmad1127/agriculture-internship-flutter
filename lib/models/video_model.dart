import 'package:flutter/cupertino.dart';

class VideoModel {
  final String title;
  final String uploadDate;
  final String video;
  final int views;
  final int comments;
  final int saves;
  final IconData menuIcon;
  final IconData viewIcon;
  final IconData commentIcon;
  final IconData saveIcon;

  VideoModel({
    required this.title,
    required this.uploadDate,
    required this.video,
    required this.views,
    required this.saves,
    required this.comments,
    required this.menuIcon,
    required this.commentIcon,
    required this.saveIcon,
    required this.viewIcon,
  });
}
