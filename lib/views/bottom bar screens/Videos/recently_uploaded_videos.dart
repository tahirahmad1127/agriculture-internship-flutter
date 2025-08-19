import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:internship_task_1/video_preview_player.dart';
import 'package:internship_task_1/views/video_player_screen.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/Videos/comments.dart';
import 'package:intl/intl.dart';

class RecentlyUploadedVideos extends StatelessWidget {
  const RecentlyUploadedVideos({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('videos')
            .orderBy('createdAt', descending: true)
            .limit(50)
            .snapshots(),
        builder: (context, snap) {
          if (!snap.hasData) return const Center(child: CircularProgressIndicator());
          if (snap.data!.docs.isEmpty) return const Center(child: Text("No videos found."));

          final videoDocs = snap.data!.docs;

          return ListView.builder(
            itemCount: videoDocs.length,
            itemBuilder: (context, index) {
              final doc = videoDocs[index];
              final data = doc.data() as Map<String, dynamic>;

              final title = data['title'] ?? '';
              final videoUrl = data['videoUrl'] ?? '';
              final thumbnailUrl = data['thumbnailUrl'] ?? '';
              final views = data['views'] ?? 0;

              String uploadDate = '';
              if (data['createdAt'] != null) {
                final createdAtValue = data['createdAt'];
                if (createdAtValue is Timestamp) {
                  uploadDate = DateFormat('dd MMM yyyy, hh:mm a').format(createdAtValue.toDate());
                } else if (createdAtValue is String) {
                  final parsedDate = DateTime.tryParse(createdAtValue);
                  if (parsedDate != null) {
                    uploadDate = DateFormat('dd MMM yyyy, hh:mm a').format(parsedDate);
                  }
                }
              }

              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth * 0.06,
                        top: screenHeight * 0.03,
                        right: screenWidth * 0.06),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: GoogleFonts.raleway(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff292929)),
                            ),
                            Text(
                              "Upload Date: $uploadDate",
                              style: GoogleFonts.raleway(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xffB4B4B4)),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.more_vert),
                        ),
                      ],
                    ),
                  ),

                  // Video preview player
                  VideoPreviewPlayer(
                    videoUrl: videoUrl,
                    thumbnailUrl: thumbnailUrl,
                    videoId: doc.id,
                    initialViews: views,
                    onOpenFull: () async {
                      try {
                        await FirebaseFirestore.instance
                            .collection('videos')
                            .doc(doc.id)
                            .update({'views': FieldValue.increment(1)});
                      } catch (_) {}
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => VideoPlayerScreen(videoUrl: videoUrl),
                        ),
                      );
                    },
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06, vertical: 8),
                    child: FutureBuilder<QuerySnapshot>(
                      future: FirebaseFirestore.instance
                          .collection('videos')
                          .doc(doc.id)
                          .collection('comments')
                          .get(),
                      builder: (context, commentSnap) {
                        final commentCount =
                        commentSnap.hasData ? commentSnap.data!.docs.length : 0;

                        return Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.remove_red_eye),
                              color: const Color(0xffB4B4B4),
                            ),
                            Text(
                              views.toString(),
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w400,
                                fontSize: 9,
                                color: const Color(0xffB4B4B4),
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Text("Views",
                                style: TextStyle(fontSize: 9, color: Color(0xffB4B4B4))),
                            const SizedBox(width: 10),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => Comments(videoId: doc.id),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.comment),
                              color: const Color(0xffB4B4B4),
                            ),
                            Text(
                              commentCount.toString(),
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w400,
                                fontSize: 9,
                                color: const Color(0xffB4B4B4),
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Text("Comments",
                                style: TextStyle(fontSize: 9, color: Color(0xffB4B4B4))),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
