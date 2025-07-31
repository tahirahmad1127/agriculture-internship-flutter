import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_task_1/models/questions_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Answer extends StatefulWidget {
  final QuestionsModel question;
  const Answer({super.key, required this.question});

  @override
  State<Answer> createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  final TextEditingController _answerController = TextEditingController();
  final PageController _controller = PageController();


  Future<void> _submitAnswer() async {

    await FirebaseFirestore.instance
    .collection('questions')
    .doc(widget.question.docId)
    .update({
      'answer' : _answerController.text.trim(),
      "status" : 'Answered',
    });
    Navigator.pop(context);
}

  @override
  Widget build(BuildContext context) {
    final Screen_height = MediaQuery.of(context).size.height;
    final Screen_width = MediaQuery.of(context).size.width;
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
                    CircleAvatar(
                      backgroundImage: NetworkImage(widget.question.profileImage),
                      radius: 16,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                            Text(
                              widget.question.authorName,
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11,
                                  color: Color(0xff292929)),
                            ),

                        Text(
                          _getTimeAgo(widget.question.createdAt),
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
                  widget.question.title,
                  style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Color(0xff292929)),
                ),
              ),
              SizedBox(
                height: Screen_height * 0.03,
              ),
              if (widget.question.images.isNotEmpty)
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox(
                      height: Screen_height * 0.25,
                      child: PageView.builder(
                        controller: _controller,
                        itemCount: widget.question.images.length,
                        itemBuilder: (context, i) {
                          return Image.network(
                            widget.question.images[i],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: Screen_height * 0.01),
                    Padding(
                      padding:  EdgeInsets.only(bottom: Screen_height * 0.01),
                      child: SmoothPageIndicator(
                        controller: _controller,
                        count: widget.question.images.length,
                        effect: WormEffect(
                          dotHeight: 6,
                          dotWidth: 6,
                          dotColor: const Color(0xffFFFFFF).withOpacity(0.7),
                          activeDotColor: const Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                  ],
                ),
              SizedBox(height: Screen_height * 0.03,),

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
          SizedBox(height: Screen_height * 0.05),
          Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: Screen_width * 0.9,
                  height: Screen_height * 0.07,
                  child: TextButton(
                    onPressed: _submitAnswer, child: Text("Send"),
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

    ]
      ),
    ),
    ),
    );
  }
}

String _getTimeAgo(DateTime dateTime) {
  final now = DateTime.now();
  final diff = now.difference(dateTime);
  if (diff.inMinutes < 1) return "Just now";
  if (diff.inMinutes < 60) return "${diff.inMinutes} mins ago";
  if (diff.inHours < 24) return "${diff.inHours} hours ago";
  return "${diff.inDays} days ago";
}
