import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/Videos/comments.dart';

class Videos extends StatelessWidget {
  const Videos({super.key});

  @override
  Widget build(BuildContext context) {
    final Screen_height = MediaQuery.of(context).size.height;
    final Screen_width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: Screen_width * 0.1,
                  right: Screen_width * 0.05,
                  top: Screen_width * 0.1),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "How to Start A Tractor",
                        style: GoogleFonts.raleway(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff292929)),
                      ),
                      Row(
                        children: [
                          Text(
                            "Upload Date:",
                            style: GoogleFonts.raleway(
                                fontSize: 9,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffB4B4B4)),
                          ),
                          Text(
                            "15 mins ago",
                            style: GoogleFonts.raleway(
                                fontSize: 9,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff292929)),
                          ),
                        ],
                      )
                    ],
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
                ],
              ),
            ),
            Image.asset(
              "assets/images/video1.png",
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: Screen_width * 0.1,
                  right: Screen_width * 0.05,
                  top: Screen_width * 0.03),
              child: Row(
                children: [
                  Icon(
                    Icons.remove_red_eye_outlined,
                    color: Color(0xffD4D4D4),
                  ),
                  SizedBox(
                    width: Screen_width * 0.03,
                  ),
                  Text(
                    "139 Views",
                    style: GoogleFonts.raleway(
                        fontSize: 9,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffD4D4D4)),
                  ),
                  SizedBox(
                    width: Screen_width * 0.1,
                  ),
                  IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Comments()));
                  }, icon: Icon(
                    Icons.chat_bubble_outline_rounded,
                    color: Color(0xffD4D4D4),
                  ),),
                  SizedBox(
                    width: Screen_width * 0.01,
                  ),
                  Text(
                    "22 Comments",
                    style: GoogleFonts.raleway(
                        fontSize: 9,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffD4D4D4)),
                  ),
                ],
              ),
            ),
            SizedBox(height: Screen_height * 0.03,),
            Padding(
              padding: EdgeInsets.only(
                  left: Screen_width * 0.1,
                  right: Screen_width * 0.05,
                  top: Screen_width * 0.1),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "How to Start A Crane",
                        style: GoogleFonts.raleway(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff292929)),
                      ),
                      Row(
                        children: [
                          Text(
                            "Upload Date:",
                            style: GoogleFonts.raleway(
                                fontSize: 9,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffB4B4B4)),
                          ),
                          Text(
                            "21 Oct, 2021 Monday",
                            style: GoogleFonts.raleway(
                                fontSize: 9,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff292929)),
                          ),
                        ],
                      )
                    ],
                  ),
                  IconButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Comments()));
                  }, icon: Icon(Icons.more_vert))
                ],
              ),
            ),
            Image.asset(
              "assets/images/video2.png",
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: Screen_width * 0.1,
                  right: Screen_width * 0.05,
                  top: Screen_width * 0.03),
              child: Row(
                children: [
                  Icon(
                    Icons.remove_red_eye_outlined,
                    color: Color(0xffD4D4D4),
                  ),
                  SizedBox(
                    width: Screen_width * 0.03,
                  ),
                  Text(
                    "139 Views",
                    style: GoogleFonts.raleway(
                        fontSize: 9,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffD4D4D4)),
                  ),
                  SizedBox(
                    width: Screen_width * 0.1,
                  ),
                  IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Comments()));
                  }, icon: Icon(
                    Icons.chat_bubble_outline_rounded,
                    color: Color(0xffD4D4D4),
                  ),),
                  SizedBox(
                    width: Screen_width * 0.01,
                  ),
                  Text(
                    "22 Comments",
                    style: GoogleFonts.raleway(
                        fontSize: 9,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffD4D4D4)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
