import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/Videos/Tabbar%20of%20Comments/all_comments.dart';

class Comments extends StatefulWidget {
  final String videoId;
  const Comments({super.key, required this.videoId});

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          shadowColor: Colors.transparent,
          leading: Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.06),
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back, color: Color(0xff339D44)),
            ),
          ),
          titleSpacing: 0,
          title: Padding(
            padding: EdgeInsets.only(left: screenHeight * 0.02),
            child: Row(
              children: [
                Text(
                  "Comments",
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w700,
                    fontSize: 23,
                    color: const Color(0xff292929),
                  ),
                ),
                SizedBox(width: screenWidth * 0.03),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('videos')
                      .doc(widget.videoId)
                      .collection('comments')
                      .where('text', isNotEqualTo: '')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Text(
                        "(0)",
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w700,
                          fontSize: 23,
                          color: const Color(0xff339D44),
                        ),
                      );
                    }

                    int commentCount = snapshot.data!.docs.length;

                    return Text(
                      "($commentCount)",
                      style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w700,
                        fontSize: 23,
                        color: const Color(0xff339D44),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight * 0.05),
            child: Container(
              height: screenHeight * 0.06,
              padding: EdgeInsets.symmetric(horizontal: screenHeight * 0.04),
              child: TabBar(
                dividerColor: Colors.transparent,
                labelColor: const Color(0xffFFFFFF),
                unselectedLabelColor: const Color(0xffB4B4B4),
                unselectedLabelStyle: const TextStyle(
                  color: Color(0xffB4B4B4),
                ),
                indicator: BoxDecoration(
                  color: const Color(0xff339D44),
                  borderRadius: BorderRadius.circular(10),
                ),
                indicatorWeight: 0,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  tabText("All"),
                  tabText("Most Recent"),
                  tabText("Relevant"),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            AllComments(videoId: widget.videoId),
            AllComments(videoId: widget.videoId),
            AllComments(videoId: widget.videoId),
          ],
        ),
      ),
    );
  }

  Widget tabText(String text) {
    return SizedBox(
      height: 50,
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.raleway(
            fontSize: 11,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
