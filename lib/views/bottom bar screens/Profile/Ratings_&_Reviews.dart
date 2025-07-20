import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/Profile/reviews%20function.dart';
class RatingsAndReviews extends StatelessWidget {
  const RatingsAndReviews({super.key});

  @override
  Widget build(BuildContext context) {
    final Screen_height = MediaQuery.of(context).size.height;
    final Screen_width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
          elevation: 0,
          shadowColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Color(0xff339D44),
              )),
          title: Padding(
            padding: EdgeInsets.only(
                left: Screen_height * 0.02, right: Screen_height * 0.02),
            child: Text(
              "Ratings & Reviews",
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w700,
                  fontSize: 23,
                  color: Color(0xff292929)),
            ),
          ),
      ),
      body: Padding(
        padding:  EdgeInsets.only(left: Screen_width * 0.05, right: Screen_width * 0.05, top: Screen_height * 0.02),
        child: Column(children: [
          Expanded(child: buildReviewList()),
        ],),
      )
    );
  }
}
