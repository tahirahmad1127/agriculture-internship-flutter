import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_task_1/views/verification_code.dart';

class ConnectionLost extends StatelessWidget {
  const ConnectionLost({super.key});

  @override
  Widget build(BuildContext context) {
    final Screen_height = MediaQuery.of(context).size.height;
    final Screen_width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding:  EdgeInsets.only(top: Screen_height * 0.45),
                child: Image.asset("assets/images/mountain.png",
                fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: Screen_height * 0.2),
                child: Image.asset("assets/images/clouds.png",
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: Screen_height * 0.08,left: Screen_width * 0.6),
                child: Image.asset("assets/images/kite.png",
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: Screen_height * 0.35),
                child: Image.asset("assets/images/kid.png",
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top: Screen_height * 0.77),
                      child: Text("Connection Lost",
                        style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w500,
                            fontSize: 23,
                            color: Color(0xff292929)
                        ),
                      ),
                    ),
                    Container(
                      width: Screen_width * 0.7,
                      child: Align(
                        child: Text("Somethhing went wrong",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color(0xffB4B4B4)
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: Screen_height * 0.03,),
                    Container(
                      height: Screen_height * 0.07,
                      width: Screen_width * 0.4,
                      child: TextButton(
                        onPressed: () {},
                        child: Text("Retry"),
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xff339D44),
                          foregroundColor: Color(0xffF4F4F4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
