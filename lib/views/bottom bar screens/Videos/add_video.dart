import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_task_1/views/account_created.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/Videos/uploaded.dart';

class AddVideo extends StatelessWidget {
  const AddVideo({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _descriptionController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.05),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
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
              color: Color(0xff292929),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/upload_video.png",
                  width: screenWidth,
                  height: screenHeight * 0.3,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: screenHeight * 0.02),

                // Upload Video
                DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(10),
                  dashPattern: [9, 9],
                  color: Color(0xff339D44),
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
                            color: Color(0xff292929),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
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
                  radius: Radius.circular(10),
                  dashPattern: [9, 9],
                  color: Color(0xff339D44),
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
                            color: Color(0xff292929),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset("assets/images/upload.png"),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),

                // Title
                Container(
                  width: screenWidth * 0.8,
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xffD4D4D4)),
                  ),
                  child: TextFormField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      hintText: "Title",
                      hintStyle: GoogleFonts.raleway(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffB4B4B4),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),

                // Description
                Container(
                  width: screenWidth * 0.8,
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xffD4D4D4)),
                  ),
                  child: TextFormField(
                    controller: _titleController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "Description",
                      hintStyle: GoogleFonts.raleway(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffB4B4B4),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
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
              onPressed: () {
                show_upoaded_dialog_box(context);
              },
              child: Text("Post"),
              style: TextButton.styleFrom(
                backgroundColor: Color(0xff339D44),
                foregroundColor: Color(0xffF4F4F4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
