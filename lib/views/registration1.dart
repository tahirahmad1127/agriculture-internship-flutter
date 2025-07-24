import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_task_1/views/login.dart';
import 'package:internship_task_1/views/registration2.dart';
import 'package:internship_task_1/services/auth.dart';

class Registration1 extends StatefulWidget {
  Registration1({super.key});

  @override
  State<Registration1> createState() => _Registration1State();
}

class _Registration1State extends State<Registration1> {
  final AuthServices _auth = AuthServices();

  TextEditingController name_controller = TextEditingController();

  TextEditingController email_controller = TextEditingController();

  TextEditingController pwd_controller = TextEditingController();

  TextEditingController confirmpwd_controller = TextEditingController();

  bool isLoading = false;
  bool userCreated = false;
  @override
  Widget build(BuildContext context) {
    final Screen_width = MediaQuery.of(context).size.width;
    final Screen_height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      "assets/images/registration1.png",
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )),
                Positioned(
                  top: Screen_height * 0.18,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    width: Screen_width,
                    height: Screen_height,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: Screen_height * 0.06,
                          left: Screen_width * 0.06,
                          right: Screen_width * 0.06),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Create Account",
                            style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w700,
                              fontSize: 23,
                              color: Color(0xff292929),
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Login to Access Your Account",
                            style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: Color(0xffB4B4B4),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: name_controller,
                            decoration: InputDecoration(
                              labelText: "Name",
                              labelStyle: GoogleFonts.raleway(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffB4B4B4)),
                              floatingLabelStyle:
                                  TextStyle(color: Color(0xff339D44)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color(0xff339D44),
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color(0xffD4D4D4),
                                  )),
                            ),
                            keyboardType: TextInputType.text,
                            obscureText: false,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: email_controller,
                            decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle: GoogleFonts.raleway(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffB4B4B4)),
                              floatingLabelStyle:
                                  TextStyle(color: Color(0xff339D44)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color(0xff339D44),
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color(0xffD4D4D4),
                                  )),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            obscureText: false,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: pwd_controller,
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: GoogleFonts.raleway(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffB4B4B4)),
                              floatingLabelStyle:
                                  TextStyle(color: Color(0xff339D44)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color(0xff339D44),
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color(0xffD4D4D4),
                                  )),
                            ),
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: confirmpwd_controller,
                            decoration: InputDecoration(
                              hintText: "Confirm Password",
                              hintStyle: GoogleFonts.raleway(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffB4B4B4)),
                              labelText: "Confirm Password",
                              labelStyle: GoogleFonts.raleway(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffB4B4B4)),
                              floatingLabelStyle:
                                  TextStyle(color: Color(0xff339D44)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color(0xff339D44),
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color(0xffD4D4D4),
                                  )),
                            ),
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                          ),
                          SizedBox(
                            height: 58,
                          ),
                          isLoading
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Container(
                                  width: Screen_width * 0.9,
                                  height: Screen_height * 0.07,
                                  child: TextButton(
                                    onPressed: () async {
                                      String email = email_controller.text.trim();
                                      String password = pwd_controller.text.trim();
                                      String confirmpwd = confirmpwd_controller.text.trim();

                                      if (!userCreated) {
                                        if (name_controller.text.isEmpty) {
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Name can't be empty")));
                                          return;
                                        }
                                        if (email_controller.text.isEmpty) {
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email can't be empty")));
                                          return;
                                        }
                                        if (pwd_controller.text.isEmpty) {
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password can't be empty")));
                                          return;
                                        }
                                        if (confirmpwd_controller.text.isEmpty) {
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Confirm Password can't be empty")));
                                          return;
                                        }
                                        if (password != confirmpwd) {
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Passwords do not match")));
                                          return;
                                        }
                                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(email)) {
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter a valid email")));
                                          return;
                                        }
                                        if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$').hasMatch(password)) {
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password must be at least 6 characters and include a letter, number, and special character")));
                                          return;
                                        }

                                        try {
                                          isLoading = true;
                                          setState(() {});

                                          await _auth.registerUser(email: email, password: password);
                                          userCreated = true;

                                          await FirebaseAuth.instance.currentUser?.sendEmailVerification();

                                          isLoading = false;
                                          setState(() {});

                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text("Verify Email"),
                                                content: Text("A verification link has been sent to your email. Please verify before continuing."),
                                              );
                                            },
                                          );
                                        } catch (e) {
                                          isLoading = false;
                                          setState(() {});
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                                        }
                                      } else {
                                        // Already created, now check verification
                                        User? currentUser = FirebaseAuth.instance.currentUser;
                                        await currentUser?.reload();
                                        if (currentUser != null && currentUser.emailVerified) {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => Registration2()));
                                        } else {
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please verify your email before continuing")));
                                        }
                                      }
                                    },

                                    child: Text("Next"),
                                    style: TextButton.styleFrom(
                                        backgroundColor: Color(0xff339D44),
                                        foregroundColor: Color(0xffF4F4F4),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        )),
                                  ),
                                ),
                          SizedBox(
                            height: 23,
                          ),
                          Text(
                            "Already have an account?",
                            style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: Color(0xff292929)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()));
                              },
                              child: Text(
                                "Login",
                                style: GoogleFonts.raleway(
                                    fontSize: 27,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff339D44)),
                              ))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
