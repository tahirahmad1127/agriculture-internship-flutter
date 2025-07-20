import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/Profile/Ratings_&_Reviews.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/Profile/review%20function%20for%20profile.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/Profile/reviews%20function.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/Profile/settings.dart';
import 'package:internship_task_1/views/navigation_bottom_bar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final Screen_height = MediaQuery.of(context).size.height;
    final Screen_width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          shadowColor: Colors.transparent,
          title: Padding(
            padding: EdgeInsets.only(
                left: Screen_height * 0.02, right: Screen_height * 0.02),
            child: Text(
              "Profile",
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w700,
                  fontSize: 23,
                  color: Color(0xff292929)),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: Screen_width * 0.05),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Settings()));
                  },
                  icon: Icon(
                    Icons.settings_outlined,
                    color: Color(0xff339D44),
                  )),
            ),
          ]),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: Screen_width * 0.11,
                child: Image.asset(
                  "assets/images/profile_image.png",
                ),
              ),
            ),
            SizedBox(
              height: Screen_height * 0.015,
            ),
            Text(
              "Muhammad Wajahat",
              style: GoogleFonts.raleway(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff111111)),
            ),
            Text(
              "mwajahat.038@gmail.com",
              style: GoogleFonts.raleway(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff339D44)),
            ),
            SizedBox(
              height: Screen_height * 0.015,
            ),
            SizedBox(
              width: Screen_width * 0.35,
              child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(

                    backgroundColor: Color(0xff339D44),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.edit_outlined,
                      color: Color(0xffF4F4F4),
                      ),
                      Text("Edit Profile",
                        style: GoogleFonts.raleway(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffFFFFFF)),
                      )
                    ],
                  )
              ),
            ),
            SizedBox(
              height: Screen_height * 0.015,
            ),
            Divider(
              color: Color(0xffD4D4D4).withOpacity(0.2),
            ),
            SizedBox(
              height: Screen_height * 0.01,
            ),
            Padding(
              padding:  EdgeInsets.only(left: Screen_height * 0.03, right: Screen_height * 0.02),
              child: Row(
                children: [
                  Text("Stats",
                    style: GoogleFonts.raleway(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff000000)),
                  ),
                  Spacer(),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationBottomBar()));
                  }, child: Text(
                    "See Dashboard",
                    style: GoogleFonts.raleway(
                        fontSize: 9,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff339D44)),
                  )
                  )
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: Screen_height * 0.03, right: Screen_height * 0.02),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: Screen_width * 0.3,
                      height: Screen_height * 0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffFBFBFB),
                      ),
                      child:Center(
                        child: Text(
                          "252 Answered",
                          style: GoogleFonts.raleway(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff292929)),
                        ),
                      ),
                    ),
                    SizedBox(width: Screen_width * 0.01,),
                    Container(
                      width: Screen_width * 0.3,
                      height: Screen_height * 0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffFBFBFB),
                      ),
                      child:Center(
                        child: Text(
                          "71 Pending",
                          style: GoogleFonts.raleway(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff292929)),
                        ),
                      ),
                    ),
                    SizedBox(width: Screen_width * 0.01,),
                    Container(
                      width: Screen_width * 0.3,
                      height: Screen_height * 0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffFBFBFB),
                      ),
                      child:Center(
                        child: Text(
                          "14 Videos Uploaded",
                          style: GoogleFonts.raleway(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff292929)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: Screen_height * 0.015,
            ),
            Divider(
              color: Color(0xffD4D4D4).withOpacity(0.2),
              height: 1,
            ),
            Padding(
              padding:  EdgeInsets.only(left: Screen_height * 0.03, right: Screen_height * 0.02),
              child: Row(
                children: [
                  Text("Ratings & Reviews",
                    style: GoogleFonts.raleway(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff000000)),
                  ),
                  Spacer(),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RatingsAndReviews()));
                  }, child: Text(
                    "See All",
                    style: GoogleFonts.raleway(
                        fontSize: 9,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff339D44)),
                  )
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: Screen_width * 0.05),
                child: buildReviewListForProfile(),
              ), // This must return ListView
            ),
          ],
        ),

    );
  }
}
