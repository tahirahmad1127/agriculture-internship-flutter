import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_task_1/models/reviews_model.dart';


List<ReviewsModel> reviews = [

  ReviewsModel(
    name: "Fareeha Sadaqat",
    date: "20 mins ago",
    review: "Recommended Expert",
    profileImage: "assets/images/fareeha.png",
    starCount: 5,
    starIcon: Icons.star_border,
  ),

  ReviewsModel(
      name: "Masab Mehmood",
      date: "11/10/2021",
      review: "Very Patient and Honest.",
      profileImage: "assets/images/masab.png",
      starCount: 4,
      starIcon: Icons.star_border),
  ReviewsModel(
      name: "Muhammad Ali",
      date: "11/10/2021",
      review: "Very Patient. Totally Recommended Expert",
      profileImage: "assets/images/ali.png",
      starCount: 2,
      starIcon: Icons.star_border),

];

Widget buildReviewListForProfile() {

  return ListView.builder(

      itemCount: reviews.length,
      itemBuilder: (context, index) {
        final Screen_height = MediaQuery.of(context).size.height;
        final Screen_width = MediaQuery.of(context).size.width;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Image.asset(reviews[index].profileImage),
                SizedBox(width: Screen_width* 0.015,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(reviews[index].name, style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w500,
                      fontSize: 11,
                      color: Color(0xff292929),
                    ),),
                    Text(reviews[index].date, style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w400,
                      fontSize: 9,
                      color: Color(0xffB4B4B4),
                    ),),
                    SizedBox(height: Screen_height * 0.02,),
                    Text(reviews[index].review, style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w400,
                      fontSize:11,
                      color: Color(0xff292929),
                    ),),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children:
                  List.generate(
                      reviews[index].starCount,
                          (_) => Icon(
                        reviews[index].starIcon,
                        color: Color(0xff339D44),
                        size: 12,
                      )
                  ),
                ),
              ],
            ),
            SizedBox(height: Screen_height * 0.05,)
          ],
        );
      });
}
