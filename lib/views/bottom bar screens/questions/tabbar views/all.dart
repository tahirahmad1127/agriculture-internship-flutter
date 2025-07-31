import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_task_1/models/questions_model.dart';
import 'package:internship_task_1/services/questions.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/questions/Answer%20Screen/answer.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/questions/tabbar%20views/no_data_found.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class All extends StatefulWidget {
  final String? filterStatus;
  const All({super.key, this.filterStatus});

  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {
  final QuestionsService _questionsService = QuestionsService();
  final Map<int, PageController> _pageControllers = {};

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<List<QuestionsModel>>(
      stream: _questionsService.getQuestionsStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final questions = snapshot.data;

        if (questions == null || questions.isEmpty) {
          return const Center(child: Text("No questions found"));
        }

        final filteredQuestions = widget.filterStatus == null
            ? questions
            : questions.where((q) => q.status == widget.filterStatus).toList();
        if(filteredQuestions.isEmpty){
          return No_data_found();
        }
        return ListView.builder(
          itemCount: filteredQuestions.length,
          itemBuilder: (context, index) {
            final question = filteredQuestions[index];
            final controller = _pageControllers.putIfAbsent(
              index,
                  () => PageController(),
            );

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: screenHeight * 0.04, top: screenHeight * 0.05, right: screenHeight * 0.04),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(question.profileImage),
                        radius: 16,
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        question.authorName,
                                        style: GoogleFonts.raleway(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 11,
                                          color: const Color(0xff292929),
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        _getTimeAgo(question.createdAt),
                                        style: GoogleFonts.raleway(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 9,
                                          color: const Color(0xffB4B4B4),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (question.status == 'Pending')
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Answer(question: question)),
                                      );
                                    },
                                    child: Text(
                                      "Answer",
                                      style: GoogleFonts.raleway(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11,
                                        color: const Color(0xff339D44),
                                      ),
                                    ),
                                  )

                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenHeight * 0.04),
                  child: Text(
                    question.title,
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: const Color(0xff292929),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                if (question.images.isNotEmpty)
                  SizedBox(
                    height: screenHeight * 0.25,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        PageView.builder(
                          controller: controller,
                          itemCount: question.images.length,
                          itemBuilder: (context, i) {
                            return Image.network(
                              question.images[i],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            );
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: screenHeight * 0.01),
                          child: SmoothPageIndicator(
                            controller: controller,
                            count: question.images.length,
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
                  ),
                Divider(
                  thickness: 1,
                  color: Colors.grey.shade300.withOpacity(0.2),
                ),
              ],
            );
          },
        );
      },
    );
  }

  String _getTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final diff = now.difference(dateTime);
    if (diff.inMinutes < 1) return "Just now";
    if (diff.inMinutes < 60) return "${diff.inMinutes} mins ago";
    if (diff.inHours < 24) return "${diff.inHours} hours ago";
    return "${diff.inDays} days ago";
  }

  @override
  void dispose() {
    for (var controller in _pageControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }
}
