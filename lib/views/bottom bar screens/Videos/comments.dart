import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_task_1/views/Search%20Screen/search_questions.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/Videos/Tabbar%20of%20Comments/all_comments.dart';

class Comments extends StatelessWidget {
  const Comments({super.key});

  @override
  Widget build(BuildContext context) {
    final Screen_width = MediaQuery.of(context).size.width;
    final Screen_height = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          shadowColor: Colors.transparent,
          leading: Padding(
            padding:  EdgeInsets.only(left: Screen_width * 0.06),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Color(0xff339D44),
                )),
          ),
          titleSpacing: 0,
          title: Padding(
            padding: EdgeInsets.only(left: Screen_height * 0.02),
            child: Row(
              children: [
                Text(
                  "Comments",
                  style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w700,
                      fontSize: 23,
                      color: Color(0xff292929)),
                ),
                SizedBox(
                  width: Screen_width * 0.03,
                ),
                Text(
                  "(22)",
                  style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w700,
                      fontSize: 23,
                      color: Color(0xff339D44)),
                ),
              ],
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(Screen_height * 0.05),
            child: Container(
              height: Screen_height * 0.06,
              padding: EdgeInsets.symmetric(horizontal: Screen_height * 0.04),
              child: TabBar(
                  dividerColor: Colors.transparent,
                  labelColor: Color(0xffFFFFFF),
                  unselectedLabelColor: Color(0xffB4B4B4),
                  unselectedLabelStyle: TextStyle(
                    color: Color(0xffB4B4B4),
                  ),
                  indicator: BoxDecoration(
                      color: Color(0xff339D44),
                      borderRadius: BorderRadius.circular(10)),
                  indicatorWeight: 0,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    SizedBox(
                      height: Screen_height * 0.06,
                      child: Center(
                        child: Text(
                          "All",
                          style: GoogleFonts.raleway(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Screen_height * 0.06,
                      child: Center(
                        child: Text(
                          "Most Recent",
                          style: GoogleFonts.raleway(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Screen_height * 0.06,
                      child: Center(
                        child: Text(
                          "Relevant",
                          style: GoogleFonts.raleway(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            AllComments(),
          ],
        ),
      ),
    );
  }
}
