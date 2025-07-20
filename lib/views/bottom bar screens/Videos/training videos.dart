import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_task_1/views/Search%20Screen/search_questions.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/Videos/Videos.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/Videos/search_videos.dart';

class TrainingVideos extends StatelessWidget {
  const TrainingVideos({super.key});

  @override
  Widget build(BuildContext context) {
    final Screen_height = MediaQuery.of(context).size.height;
    final Screen_width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            elevation: 0,
            shadowColor: Colors.transparent,
            title: Padding(
              padding: EdgeInsets.only(
                  left: Screen_height * 0.02, right: Screen_height * 0.02),
              child: Text(
                "Training Videos",
                style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w700,
                    fontSize: 23,
                    color: Color(0xff292929)),
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
                            "Recently Uploaded",
                            style: GoogleFonts.raleway(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchVideos()));
                  },
                  icon: Icon(
                    Icons.search,
                    color: Color(0xff339D44),
                  )),
              Padding(
                padding: EdgeInsets.only(right: Screen_height * 0.02),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchQuestions()));
                    },
                    icon: Icon(
                      Icons.add,
                      color: Color(0xff339D44),
                    )),
              ),
            ]),
        body: TabBarView(
          children: [
            Videos(),
          ],
        ),
      ),
    );
  }
}
