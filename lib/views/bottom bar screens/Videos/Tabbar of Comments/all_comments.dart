import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class AllComments extends StatelessWidget {
  final String videoId;

  const AllComments({super.key, required this.videoId});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: screenWidth * 0.06,
          right: screenWidth * 0.06,
          top: screenHeight * 0.04,
        ),
        child: Column(
          children: [
            FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance
                  .collection('videos')
                  .doc(videoId)
                  .get(),
              builder: (context, videoSnapshot) {
                if (!videoSnapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                String videoTitle =
                    videoSnapshot.data!['title'] ?? 'Unknown Title';

                return Row(
                  children: [
                    Text(
                      "Video ",
                      style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: const Color(0xff339D44),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        ": $videoTitle",
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: const Color(0xff292929),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                );
              },
            ),

            SizedBox(height: screenHeight * 0.05),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('videos')
                    .doc(videoId)
                    .collection('comments')
                    .orderBy('timestamp', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text("No comments yet"));
                  }

                  var comments = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: comments.length,
                    itemBuilder: (context, index) {
                      var commentData =
                      comments[index].data() as Map<String, dynamic>;

                      String username = commentData['user'] ?? 'Unknown User';
                      String profilePic = (commentData['image'] != null &&
                          commentData['image'].toString().isNotEmpty)
                          ? commentData['image']
                          : 'https://via.placeholder.com/150';
                      String commentText = commentData['text'] ?? '';
                      String formattedDate =
                      commentData['timestamp'] != null
                          ? DateFormat('dd/MM/yyyy').format(
                        commentData['timestamp'].toDate(),
                      )
                          : '';

                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipOval(
                            child: Image.network(
                              profilePic,
                              width: 30,
                              height: 30,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.network(
                                  'https://via.placeholder.com/150',
                                  width: 30,
                                  height: 30,
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  username,
                                  style: GoogleFonts.raleway(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11,
                                    color: const Color(0xff292929),
                                  ),
                                ),
                                Text(
                                  formattedDate,
                                  style: GoogleFonts.raleway(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 9,
                                    color: const Color(0xffB4B4B4),
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                Text(
                                  commentText,
                                  style: GoogleFonts.raleway(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11,
                                    color: const Color(0xff292929),
                                  ),
                                ),
                                Divider(
                                  color:
                                  const Color(0xffD4D4D4).withOpacity(0.2),
                                ),
                                SizedBox(height: screenHeight * 0.03),
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
