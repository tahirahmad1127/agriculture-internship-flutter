import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_task_1/services/VideoUpload.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/Videos/uploaded.dart';

class AddVideo extends StatefulWidget {
  final String? videoDocId; // pass doc id when editing
  const AddVideo({super.key, this.videoDocId});

  @override
  State<AddVideo> createState() => _AddVideoState();
}

File? selectedVideo;
File? selectedThumbnail;
String? videoUrl;
String? thumbnailUrl;
final videoUploadService = VideoUploadService();
final TextEditingController _titleController = TextEditingController();
final TextEditingController _descriptionController = TextEditingController();

Future<void> pickVideo() async {
  final result = await FilePicker.platform.pickFiles(type: FileType.video);
  if (result != null) {
    final file = File(result.files.single.path!);
    selectedVideo = file;
    videoUrl = await videoUploadService.uploadMedia(file);
  }
}

Future<void> pickThumbnail() async {
  final result = await FilePicker.platform.pickFiles(type: FileType.image);
  if (result != null) {
    final file = File(result.files.single.path!);
    selectedThumbnail = file;
    thumbnailUrl = await videoUploadService.uploadMedia(file);
  }
}

class _AddVideoState extends State<AddVideo> {
  Widget _buildThumbnail(double screenWidth, double screenHeight) {
    // If user has picked a thumbnail, show it first
    if (selectedThumbnail != null) {
      return Image.file(
        selectedThumbnail!,
        width: screenWidth,
        height: screenHeight * 0.3,
        fit: BoxFit.cover,
      );
    }

    if (widget.videoDocId != null) {
      return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('videos')
            .doc(widget.videoDocId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.exists) {
            final data = snapshot.data!.data() as Map<String, dynamic>?;
            final url = data?['thumbnailUrl'];
            if (url != null && url.toString().isNotEmpty) {
              return Image.network(
                url,
                width: screenWidth,
                height: screenHeight * 0.3,
                fit: BoxFit.cover,
              );
            }
          }
          // fallback
          return Image.asset(
            "assets/images/upload_video.png",
            width: screenWidth,
            height: screenHeight * 0.3,
            fit: BoxFit.cover,
          );
        },
      );
    }

    // Default asset
    return Image.asset(
      "assets/images/upload_video.png",
      width: screenWidth,
      height: screenHeight * 0.3,
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.05),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xff339D44),
            ),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.03),
          child: Text(
            "Add Video",
            style: GoogleFonts.raleway(
              fontWeight: FontWeight.w700,
              fontSize: 23,
              color: const Color(0xff292929),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Center(
            child: Column(
              children: [
                _buildThumbnail(screenWidth, screenHeight),
                SizedBox(height: screenHeight * 0.02),

                DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10),
                  dashPattern: const [9, 9],
                  color: const Color(0xff339D44),
                  child: Container(
                    width: screenWidth * 0.8,
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Upload Video",
                          style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: const Color(0xff292929),
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            await pickVideo();
                            setState(() {});
                          },
                          icon: Image.asset("assets/images/upload.png"),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),

                // Upload Thumbnail
                DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10),
                  dashPattern: const [9, 9],
                  color: const Color(0xff339D44),
                  child: Container(
                    width: screenWidth * 0.8,
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Upload Thumbnail",
                          style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: const Color(0xff292929),
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            await pickThumbnail();
                            setState(() {});
                          },
                          icon: Image.asset("assets/images/upload.png"),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),

                Container(
                  width: screenWidth * 0.8,
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xffD4D4D4)),
                  ),
                  child: TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      hintText: "Title",
                      hintStyle: GoogleFonts.raleway(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xffB4B4B4),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),

                Container(
                  width: screenWidth * 0.8,
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xffD4D4D4)),
                  ),
                  child: TextFormField(
                    controller: _descriptionController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "Description",
                      hintStyle: GoogleFonts.raleway(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xffB4B4B4),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.1,
            right: screenWidth * 0.1,
            bottom: screenHeight * 0.02,
          ),
          child: SizedBox(
            width: screenWidth * 0.8,
            height: screenHeight * 0.07,
            child: TextButton(
              onPressed: () async {
                if (videoUrl == null || thumbnailUrl == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please upload both video and thumbnail")),
                  );
                  return;
                }
                if (_titleController.text.isEmpty ||
                    _descriptionController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Title and Description cannot be empty")),
                  );
                  return;
                }

                final docRef = FirebaseFirestore.instance.collection('videos').doc();

                await docRef.set({
                  'title': _titleController.text.trim(),
                  'description': _descriptionController.text.trim(),
                  'videoUrl': videoUrl,
                  'thumbnailUrl': thumbnailUrl,
                  'views': 0,
                  'createdAt': FieldValue.serverTimestamp(),
                });


                show_upoaded_dialog_box(context);
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xff339D44),
                foregroundColor: const Color(0xffF4F4F4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text("Post"),
            ),
          ),
        ),
      ),
    );
  }
}
