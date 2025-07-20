import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_task_1/views/navigation_bottom_bar.dart';
import 'package:internship_task_1/views/verification_code.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    final Screen_height = MediaQuery.of(context).size.height;
    final Screen_width = MediaQuery.of(context).size.width;
    return Scaffold(
    body: Column(
      children: [
        Stack(
          children: [
               Image.asset("assets/images/404_not_found.png",
               fit: BoxFit.cover,
               width: double.infinity,
               ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: Screen_height * 0.6),
                    child: Text("Page Not Found",
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
                      child: Text("The page you are looking for doesn’t seem to exist…",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xffB4B4B4)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: Screen_height * 0.02,),
                  Container(
                    height: Screen_height * 0.07,
                    width: Screen_width * 0.6,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> GreenDiaglogBox()));
                      },
                      child: Text("Back To Home"),
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
        )
      ],
    ),
    );
  }
}
