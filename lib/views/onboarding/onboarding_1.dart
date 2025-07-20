import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    final Screen_width = MediaQuery.of(context).size.width;
    final Screen_height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(top: Screen_height * 0.05),
        child: Column(
          children: [
            Container(
              height: 370,
              width: 500,
              child: Stack(
                children: [
                    Positioned(
                      top: Screen_height * 0.065,
                      left: Screen_width * 0.35,
                      bottom: Screen_height * 0.01,
                      child: Transform.rotate(
                        angle: 0.07,
                        child: Container(
                                height: 312,
                                width: 408,
                                decoration: BoxDecoration(
                                  color: Color(0xff339D44).withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),

                      ),
                    ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                        width: 319,
                        height: 292,
                        child: Image.asset("assets/images/Onboarding_1.png")),
                  )
                ],
              ),
            ),
            SizedBox(height: Screen_height * 0.06,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: Screen_width * 0.05),
              child: Text("Get Rid of Third Person",
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.w700,
                fontSize: 33,
                color: Color(0xff292929)
              )
              ),
            ),
            SizedBox(height: 12,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: Screen_width * 0.05),
              child: Text("Using this application you can get rid of paying commission fee to third person. Now you can directly chat with sellers and deal with them.",
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.w400,
                fontSize: 19,
                color: Color(0xffB4B4B4)
              ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
