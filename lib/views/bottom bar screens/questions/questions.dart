import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_task_1/views/Search%20Screen/search_questions.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/questions/tabbar%20views/all.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/questions/tabbar%20views/no_data_found.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  @override
  Widget build(BuildContext context) {
    final Screen_height = MediaQuery.of(context).size.height;
    final Screen_width = MediaQuery.of(context).size.width;

    return  DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
          shadowColor: Colors.transparent,
          title:
          Padding(
            padding:  EdgeInsets.only(left: Screen_height * 0.02),
            child: Text("Questions",
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w700,
                  fontSize: 23,
                  color: Color(0xff292929)
              ),
            ),
          ),

          bottom: PreferredSize(
            preferredSize: Size.fromHeight( Screen_height * 0.05),
            child: Container(
              height: Screen_height * 0.06,
              padding: EdgeInsets.symmetric(
                horizontal: Screen_height * 0.04
              ),
              child: TabBar(
                dividerColor: Colors.transparent,
                  labelColor: Color(0xffFFFFFF),
                  unselectedLabelColor: Color(0xffB4B4B4),
                  unselectedLabelStyle: TextStyle(
                    color: Color(0xffB4B4B4),
                  ),
                  indicator: BoxDecoration(
                    color: Color(0xff339D44),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  indicatorWeight: 0,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs:  [
                    SizedBox(
                      height: Screen_height* 0.06,
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
                      height: Screen_height* 0.06,
                      child: Center(
                        child: Text(
                          "Pending",
                          style: GoogleFonts.raleway(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Screen_height* 0.06,
                      child: Center(
                        child: Text(
                          "Answered",
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
          actions : [
            Padding(
              padding:  EdgeInsets.only(right: Screen_width * 0.05),
              child: IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchQuestions()));
              }, icon: Icon(
                  Icons.search,
                  color: Color(0xff339D44),
                )),
            ),
          ]
        ),
        body: TabBarView (
          children: [
            All(),
            All(filterStatus: 'Pending',),
            All(filterStatus: 'Answered',),

          ],
        ),
      ),
    );
  }
}
