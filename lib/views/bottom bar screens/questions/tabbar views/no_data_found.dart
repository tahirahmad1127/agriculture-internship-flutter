import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class No_data_found extends StatelessWidget {
  const No_data_found({super.key});

  @override
  Widget build(BuildContext context) {
    final Screen_height = MediaQuery.of(context).size.height;
    final Screen_width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: Screen_height * 0.3),
                  child: Image.asset("assets/images/no_data_found.png"),
                ),
                Column(
                  children: [
                    Center(
                        child: Padding(
                          padding:  EdgeInsets.only(top: Screen_height * 0.1),
                          child: Image.asset("assets/images/no_data_found_2.png"),
                        )
                    ),
                    SizedBox(
                      height: Screen_height * 0.05,
                    ),
                    Text("No Data Found",
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w500,
                      fontSize: 23,
                      color: Color(0xff292929)
                    ),
                    ),
                    Container(
                      width: Screen_width * 0.6,
                      child: Align(
                        child: Text("You have not answered any questions yet",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color(0xffB4B4B4)
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
