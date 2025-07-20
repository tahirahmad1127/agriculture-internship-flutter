import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_task_1/views/navigation_bottom_bar.dart';

class NoDataFound extends StatelessWidget {
  const NoDataFound({super.key});

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
                padding:  EdgeInsets.only(top: Screen_height * 0.5),
                child: Image.asset("assets/images/no_data_found.png"),
              ),
              Column(
                children: [
                  Center(
                      child: Padding(
                        padding:  EdgeInsets.only(top: Screen_height * 0.2),
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
                    width: Screen_width * 0.9,
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
                  SizedBox(height: Screen_height * 0.02,),
                  Container(
                    height: Screen_height * 0.07,
                    width: Screen_width * 0.4,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationBottomBar()));
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
            ],
          )
        ],
      ),
    );
  }
}
