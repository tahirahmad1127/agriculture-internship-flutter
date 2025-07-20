import 'package:flutter/cupertino.dart';
class ReviewsModel {
  final String name;
  final String date;
  final String review;
  final String profileImage;
  final int starCount;
  final IconData starIcon;

  ReviewsModel({
   required this.name,
   required this.date,
    required this.review,
    required this.profileImage,
    required this.starCount,
    required this.starIcon,
});
}