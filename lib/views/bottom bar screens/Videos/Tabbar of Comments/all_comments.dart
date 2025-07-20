import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_task_1/models/all_comment_model.dart';
class AllComments extends StatelessWidget {

  final List<AllComment> allComments = [
    AllComment(
      name: "Masab Mehmood",
      date: "11/10/2021",
      comment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pulvinar ante id netus sit congue justo. Felis, volutpat sit senectus tempor, aliquam. Tellus proin enim orci in ullamcorper egestas dolor. Dictumst sed.",
      imagePath: "assets/images/masab.png",
    ),
    AllComment(
      name: "Gusti Ilham Tauhid",
      date: "11/10/2021",
      comment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pulvinar ante id netus sit congue justo. Felis, volutpat sit senectus tempor, aliquam. Tellus proin enim orci in ullamcorper egestas dolor. Dictumst sed.",
      imagePath: "assets/images/gusti.png",
    ),
    AllComment(
      name: "Adhitia Panji K.W",
      date: "11/10/2021",
      comment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pulvinar ante id netus sit congue justo. Felis, volutpat sit senectus tempor, aliquam. Tellus proin enim orci in ullamcorper egestas dolor. Dictumst sed.",
      imagePath: "assets/images/adi.png",
    ),
    AllComment(
      name: "Dazzy",
      date: "11/10/2021",
      comment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pulvinar ante id netus sit congue justo. Felis, volutpat sit senectus tempor, aliquam. Tellus proin enim orci in ullamcorper egestas dolor. Dictumst sed.",
      imagePath: "assets/images/dazzy.png",
    ),
    AllComment(
      name: "Althaf Ukail",
      date: "11/10/2021",
      comment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pulvinar ante id netus sit congue justo. Felis, volutpat sit senectus tempor, aliquam. Tellus proin enim orci in ullamcorper egestas dolor. Dictumst sed.",
      imagePath: "assets/images/altaf.png",
    )
  ];

   AllComments({super.key});

  @override
  Widget build(BuildContext context) {
    final Screen_width = MediaQuery.of(context).size.width;
    final Screen_height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(left: Screen_width * 0.06, right: Screen_width * 0.06, top: Screen_height * 0.04),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Video ",
                  style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Color(0xff339D44)),
                ),

                Text(
                  ": How to Start A Tractor",
                  style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Color(0xff292929)),
                ),
              ],
            ),
            SizedBox(height: Screen_height * 0.05,),
            Expanded(
              child: ListView.builder(
                itemCount: allComments.length,
                  itemBuilder: (context, index){
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(allComments[index].imagePath),
                      SizedBox(width: Screen_width* 0.02,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(allComments[index].name,
                            style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w500,
                              fontSize: 11,
                              color: Color(0xff292929),
                            ),
                            ),
                            Text(allComments[index].date,
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w400,
                                fontSize: 9,
                                color: Color(0xffB4B4B4),
                              ),
                            ),
                            SizedBox(height: Screen_height * 0.01,),
                            Text(allComments[index].comment,
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w400,
                                fontSize: 11,
                                color: Color(0xff292929),
                              ),
                            ),
                            Divider(
                              color: Color(0xffD4D4D4).withOpacity(0.2),
                            ),
                            SizedBox(height: Screen_height * 0.03,),

                          ],
                        ),
                      )
                    ],
                  );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
