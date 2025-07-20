import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash_Screen extends StatelessWidget {
  const Splash_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final Screen_width = MediaQuery.of(context).size.width;
    final Screen_height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
           Center(child: Image.asset("assets/images/splash_logo.png")),
          SizedBox(height: Screen_height * 0.4,),
          Text("Powered by",
          style: GoogleFonts.raleway(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xffB7B9C6),
          ),
          ),
          SizedBox(height: 12,),
          Padding(
            padding: const EdgeInsets.only(bottom: 31),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/splash_2.png"),
                SizedBox(width: 5,),
                Text("FARM TECH",
                style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w300,
                  fontSize: 19,
                  color: Color(0xff292929),
                ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
