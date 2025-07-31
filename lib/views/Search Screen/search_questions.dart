import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/questions/Answer%20Screen/answer.dart';
import 'package:internship_task_1/models/questions_model.dart';


final dummyQuestion = QuestionsModel(
  docId: "dummyId",
  createdAt: DateTime.now(),
  profileImage: "https://example.com/image.png",
  authorName: "Masab Mehmood",
  title: "What is the process of purchasing Vehicle from hardware store?",
  images: [],
  status: "Pending",
);




class SearchQuestions extends StatefulWidget {
  const SearchQuestions({super.key});

  @override
  State<SearchQuestions> createState() => _SearchQuestionsState();
}

class _SearchQuestionsState extends State<SearchQuestions> {
  @override
  Widget build(BuildContext context) {
    final Screen_height = MediaQuery.of(context).size.height;
    final Screen_width = MediaQuery.of(context).size.width;
    TextEditingController _searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
          actions : [
            Padding(
              padding:  EdgeInsets.only(right: Screen_width * 0.03),
              child: IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(
                Icons.close,
                color: Color(0xff339D44),
              )),
            ),
          ]
      ),
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: Screen_width * 0.09 ),
            child: TextFormField(
                controller: _searchController,
                maxLines: 1,
                decoration: InputDecoration(
                    labelText: "Purchasing Vehicle",
                    alignLabelWithHint: true,
                    labelStyle: GoogleFonts.raleway(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffB4B4B4),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xffB4B4B4))
                    )
                )
            ),
          ),
          SizedBox(height: Screen_height * 0.05,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Screen_width * 0.09),
            child: Row(
              children: [
                Image.asset("assets/images/ali.png"),
                SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Muhammad Ali Nizami",
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w500,
                                fontSize: 11,
                                color: Color(0xff292929),
                              ),
                            ),
                            Text(
                              "20 mins ago",
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w400,
                                fontSize: 9,
                                color: Color(0xffB4B4B4),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: Screen_width * 0.22,),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Answer(question: dummyQuestion),
                            ));
                          },
                          child: Text(
                            "Answer",
                            style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                              color: Color(0xff339D44),
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
          SizedBox(
            height: Screen_height * 0.01,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Screen_height * 0.04),
            child: Text(
              "What is the process of purchasing Vehicle from hardware store?",
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: Color(0xff292929)),
            ),
          ),
          SizedBox(height: Screen_height * 0.05,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Screen_width * 0.09),
            child: Row(
              children: [
                Image.asset("assets/images/masab.png"),
                SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Masab Mehmood",
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w500,
                                fontSize: 11,
                                color: Color(0xff292929),
                              ),
                            ),
                            Text(
                              "20 mins ago",
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w400,
                                fontSize: 9,
                                color: Color(0xffB4B4B4),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: Screen_width * 0.30,),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Answer(question: dummyQuestion,),
                            ));
                          },
                          child: Text(
                            "Answer",
                            style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                              color: Color(0xff339D44),
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
          SizedBox(
            height: Screen_height * 0.01,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Screen_height * 0.04),
            child: Text(
              "What is the process of purchasing Vehicle from hardware store?",
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: Color(0xff292929)),
            ),
          ),
        ],
      ),
    );
  }
}
