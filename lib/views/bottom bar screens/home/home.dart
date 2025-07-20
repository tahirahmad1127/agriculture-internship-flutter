import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final Screen_width = MediaQuery.of(context).size.width;
    final Screen_height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.only(left: Screen_width * 0.05, top: Screen_height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Dashboard!",
              style: GoogleFonts.raleway(
                fontSize: 23,
                fontWeight: FontWeight.w700,
                color: Color(0xff292929),
              ),
              ),
              Row(
                children: [
                  Text("Welcome to Dashboard, ",
                    style: GoogleFonts.raleway(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffB4B4B4),
                    ),
                  ),
                  Text("Ali ",
                    style: GoogleFonts.raleway(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff292929),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Screen_height * 0.032,),
              Row(
                children: [
                  Container(
                    width: Screen_width * 0.43,
                    height: Screen_height * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffFFFFFF)
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Image.asset("assets/images/home1.png"),
                          SizedBox(width: Screen_width * 0.03,),
                          Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text("224",
                            style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w700,
                              fontSize: 23,
                              color: Color(0xff292929),
                            ),
                            ),
                            Text("Total Questions",
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w400,
                                fontSize: 9.26,
                                color: Color(0xff292929),
                              ),
                            )
                          ],
                        )
                      ]
                    ),
                  ),
                  SizedBox(width: Screen_width * 0.025,),
                  Container(
                    width: Screen_width * 0.43,
                    height: Screen_height * 0.15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffFFFFFF)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/home2.png"),
                          SizedBox(width: Screen_width * 0.03,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("154",
                                style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 23,
                                  color: Color(0xff292929),
                                ),
                              ),
                              Container(
                                width: Screen_width * 0.2,
                                child: Text("Answered Questions",
                                  style: GoogleFonts.raleway(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 9.26,
                                    color: Color(0xff292929),
                                  ),
                                ),
                              )
                            ],
                          )
                        ]
                    ),
                  ),
                ],
              ),
              SizedBox(height: Screen_height * 0.01,),
              Row(
                children: [
                  Container(
                    width: Screen_width * 0.43,
                    height: Screen_height * 0.15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffFFFFFF)
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/home3.png"),
                          SizedBox(width: Screen_width * 0.03,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text("1.5k",
                                style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 23,
                                  color: Color(0xff292929),
                                ),
                              ),
                              Text("Total Views",
                                style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 9.26,
                                  color: Color(0xff292929),
                                ),
                              )
                            ],
                          )
                        ]
                    ),
                  ),
                  SizedBox(width: Screen_width * 0.025,),
                  Container(
                    width: Screen_width * 0.43,
                    height: Screen_height * 0.15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffFFFFFF)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/home4.png"),
                          SizedBox(width: Screen_width * 0.03,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text("12",
                                style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 23,
                                  color: Color(0xff292929),
                                ),
                              ),
                              Text("Total Videos",
                                style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 9.26,
                                  color: Color(0xff292929),
                                ),
                              )
                            ],
                          )
                        ]
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
