import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key});



  @override
  Widget build(BuildContext context) {

    final Screen_height = MediaQuery.of(context).size.height;
    final Screen_width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xff339D44),
      body: Stack(
        children: [
          Image.asset("assets/images/no_internet.png",
              fit: BoxFit.cover,
            ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding:  EdgeInsets.only(right: Screen_width * 0.05, bottom: Screen_height * 0.25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Connection Lost",
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w500,
                    fontSize: 23,
                    color: Color(0xffFFFFFF)
                  ),
                  ),
                  Text("Something went wrong.",
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color(0xffFFFFFF)
                    ),
                  ),
                  SizedBox(height: Screen_height * 0.02,),
                  Container(
                    height: Screen_height * 0.065,
                    width: Screen_width * 0.35,
                    child: TextButton(
                      onPressed: () {
                      },
                      child: Text("Retry"),
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xffFFFFFF),
                        foregroundColor: Color(0xff116B1F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
