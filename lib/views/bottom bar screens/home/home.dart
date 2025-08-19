import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Future<String> getUserName() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final doc = await FirebaseFirestore.instance.collection("users").doc(user.uid).get();
      if (doc.exists && doc.data()!.containsKey("name")) {
        return doc["name"];
      }
    }
    return "User";
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.05, top: screenHeight * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dashboard!",
                style: GoogleFonts.raleway(
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff292929),
                ),
              ),
              Row(
                children: [
                  Text(
                    "Welcome to Dashboard, ",
                    style: GoogleFonts.raleway(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffB4B4B4),
                    ),
                  ),
                  FutureBuilder<String>(
                    future: getUserName(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text(
                          "...",
                          style: GoogleFonts.raleway(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff292929),
                          ),
                        );
                      }
                      if (snapshot.hasError) {
                        return Text(
                          "Error",
                          style: GoogleFonts.raleway(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff292929),
                          ),
                        );
                      }
                      return Text(
                        snapshot.data ?? "User",
                        style: GoogleFonts.raleway(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff292929),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.032),
              Row(
                children: [
                  Container(
                    width: screenWidth * 0.43,
                    height: screenHeight * 0.15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffFFFFFF)),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Image.asset("assets/images/home1.png"),
                      SizedBox(width: screenWidth * 0.03),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "224",
                            style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w700,
                              fontSize: 23,
                              color: const Color(0xff292929),
                            ),
                          ),
                          Text(
                            "Total Questions",
                            style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w400,
                              fontSize: 9.26,
                              color: const Color(0xff292929),
                            ),
                          )
                        ],
                      )
                    ]),
                  ),
                  SizedBox(width: screenWidth * 0.025),
                  Container(
                    width: screenWidth * 0.43,
                    height: screenHeight * 0.15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffFFFFFF)),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Image.asset("assets/images/home2.png"),
                      SizedBox(width: screenWidth * 0.03),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "154",
                            style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w700,
                              fontSize: 23,
                              color: const Color(0xff292929),
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.2,
                            child: Text(
                              "Answered Questions",
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w400,
                                fontSize: 9.26,
                                color: const Color(0xff292929),
                              ),
                            ),
                          )
                        ],
                      )
                    ]),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.01),
              Row(
                children: [
                  Container(
                    width: screenWidth * 0.43,
                    height: screenHeight * 0.15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffFFFFFF)),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Image.asset("assets/images/home3.png"),
                      SizedBox(width: screenWidth * 0.03),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "1.5k",
                            style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w700,
                              fontSize: 23,
                              color: const Color(0xff292929),
                            ),
                          ),
                          Text(
                            "Total Views",
                            style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w400,
                              fontSize: 9.26,
                              color: const Color(0xff292929),
                            ),
                          )
                        ],
                      )
                    ]),
                  ),
                  SizedBox(width: screenWidth * 0.025),
                  Container(
                    width: screenWidth * 0.43,
                    height: screenHeight * 0.15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffFFFFFF)),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Image.asset("assets/images/home4.png"),
                      SizedBox(width: screenWidth * 0.03),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "12",
                            style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w700,
                              fontSize: 23,
                              color: const Color(0xff292929),
                            ),
                          ),
                          Text(
                            "Total Videos",
                            style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w400,
                              fontSize: 9.26,
                              color: const Color(0xff292929),
                            ),
                          )
                        ],
                      )
                    ]),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
