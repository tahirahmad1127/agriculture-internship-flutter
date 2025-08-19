import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:internship_task_1/views/bottom%20bar%20screens/Profile/Ratings_&_Reviews.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/Profile/edit_profile.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/Profile/review%20function%20for%20profile.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/Profile/settings.dart';
import 'package:internship_task_1/views/navigation_bottom_bar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final Screen_height = MediaQuery.of(context).size.height;
    final Screen_width = MediaQuery.of(context).size.width;

    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        shadowColor: Colors.transparent,
        title: Padding(
          padding: EdgeInsets.only(
              left: Screen_height * 0.02, right: Screen_height * 0.02),
          child: Text(
            "Profile",
            style: GoogleFonts.raleway(
                fontWeight: FontWeight.w700,
                fontSize: 23,
                color: const Color(0xff292929)),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: Screen_width * 0.05),
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                   MaterialPageRoute(builder: (context) =>  ProfileSettings()));
              },
              icon: const Icon(
                Icons.settings_outlined,
                color: Color(0xff339D44),
              ),
            ),
          ),
        ],
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(user?.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          var userData = snapshot.data!.data() as Map<String, dynamic>?;

          String name = userData?["name"] ?? user?.displayName ?? "No Name";
          String email = userData?["email"] ?? user?.email ?? "No Email";
          String? profilePic = userData?["profileImage"] ?? user?.photoURL;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: Screen_width * 0.11,
                  backgroundImage: profilePic != null && profilePic.isNotEmpty
                      ? NetworkImage(profilePic)
                      : const AssetImage("assets/images/profile_image.png")
                  as ImageProvider,
                ),
              ),
              SizedBox(height: Screen_height * 0.015),
              Text(
                name,
                style: GoogleFonts.raleway(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff111111),
                ),
              ),
              Text(
                email,
                style: GoogleFonts.raleway(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff339D44),
                ),
              ),
              SizedBox(height: Screen_height * 0.015),
              SizedBox(
                width: Screen_width * 0.35,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>  EditProfile()));
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xff339D44),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(Icons.edit_outlined, color: Color(0xffF4F4F4)),
                      Text(
                        "Edit Profile",
                        style: GoogleFonts.raleway(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xffFFFFFF),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: Screen_height * 0.015),
              Divider(color: const Color(0xffD4D4D4).withOpacity(0.2)),
              SizedBox(height: Screen_height * 0.01),
              Padding(
                padding: EdgeInsets.only(
                    left: Screen_height * 0.03, right: Screen_height * 0.02),
                child: Row(
                  children: [
                    Text(
                      "Stats",
                      style: GoogleFonts.raleway(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff000000),
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NavigationBottomBar(),
                          ),
                        );
                      },
                      child: Text(
                        "See Dashboard",
                        style: GoogleFonts.raleway(
                          fontSize: 9,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff339D44),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: Screen_height * 0.03, right: Screen_height * 0.02),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildStatBox("252 Answered", Screen_width, Screen_height),
                      SizedBox(width: Screen_width * 0.01),
                      _buildStatBox("71 Pending", Screen_width, Screen_height),
                      SizedBox(width: Screen_width * 0.01),
                      _buildStatBox("14 Videos Uploaded", Screen_width, Screen_height),
                    ],
                  ),
                ),
              ),
              SizedBox(height: Screen_height * 0.015),
              Divider(color: const Color(0xffD4D4D4).withOpacity(0.2), height: 1),
              Padding(
                padding: EdgeInsets.only(
                    left: Screen_height * 0.03, right: Screen_height * 0.02),
                child: Row(
                  children: [
                    Text(
                      "Ratings & Reviews",
                      style: GoogleFonts.raleway(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff000000),
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RatingsAndReviews()),
                        );
                      },
                      child: Text(
                        "See All",
                        style: GoogleFonts.raleway(
                          fontSize: 9,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff339D44),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Screen_width * 0.05),
                  child: buildReviewListForProfile(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildStatBox(String text, double width, double height) {
    return Container(
      width: width * 0.3,
      height: height * 0.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xffFBFBFB),
      ),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.raleway(
            fontSize: 11,
            fontWeight: FontWeight.w400,
            color: const Color(0xff292929),
          ),
        ),
      ),
    );
  }
}
