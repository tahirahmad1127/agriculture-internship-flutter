import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Answer extends StatelessWidget {
  const Answer({super.key});

  @override
  Widget build(BuildContext context) {
    final Screen_height = MediaQuery.of(context).size.height;
    final Screen_width = MediaQuery.of(context).size.width;
    TextEditingController _answerController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title:
        Text("Answer",
            style: GoogleFonts.raleway(
                fontWeight: FontWeight.w700,
                fontSize: 23,
                color: Color(0xff292929)
            ),
          ),

        leading:  IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(
        Icons.arrow_back,
        color: Color(0xff339D44),
      )),
      ),
      body: Padding(
        padding:  EdgeInsets.only(top: Screen_height * 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Screen_height * 0.04),
                child: Row(
                  children: [
                    Image.asset("assets/images/ali.png"),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                            Text(
                              "Muhammad ALi Nizami",
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11,
                                  color: Color(0xff292929)),
                            ),
          
                        Text(
                          "20 mins ago",
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w400,
                              fontSize: 9,
                              color: Color(0xffB4B4B4)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Screen_height * 0.03,
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
              SizedBox(
                height: Screen_height * 0.03,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: Screen_height * 0.04 ),
                child: TextFormField(
                  controller: _answerController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: "Enter Your answer",
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
              SizedBox(height: Screen_height * 0.39,),
          
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: Screen_width * 0.9,
                  height: Screen_height * 0.07,
                  child: TextButton(
                    onPressed: (){}, child: Text("Send"),
                    style: TextButton.styleFrom(
                        backgroundColor: Color(0xff339D44),
                        foregroundColor: Color(0xffF4F4F4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
