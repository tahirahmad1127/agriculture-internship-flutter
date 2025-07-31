import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_task_1/services/auth.dart';
import 'package:internship_task_1/views/forgot_password.dart';
import 'package:internship_task_1/views/navigation_bottom_bar.dart';
import 'package:internship_task_1/views/registration1.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController name_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController pwd_controller = TextEditingController();
  TextEditingController confirmpwd_controller = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final Screen_width = MediaQuery.of(context).size.width;
    final Screen_height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                    "assets/images/login.png",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  top: Screen_height * 0.33,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    width: Screen_width,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: Screen_height * 0.06,
                          left: Screen_width * 0.06,
                          right: Screen_width * 0.06,
                          bottom: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome Again",
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w700,
                                fontSize: 23,
                                color: Color(0xff292929),
                              ),
                            ),
                            SizedBox(height: 7),
                            Text(
                              "Login to Access Your Account",
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: Color(0xffB4B4B4),
                              ),
                            ),
                            SizedBox(height: 30),
                            TextFormField(
                              controller: email_controller,
                              decoration: InputDecoration(
                                labelText: "Email",
                                labelStyle: GoogleFonts.raleway(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffB4B4B4),
                                ),
                                floatingLabelStyle:
                                TextStyle(color: Color(0xff339D44)),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color(0xff339D44),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color(0xffD4D4D4),
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.text,
                              obscureText: false,
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              controller: pwd_controller,
                              decoration: InputDecoration(
                                labelText: "Password",
                                labelStyle: GoogleFonts.raleway(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffB4B4B4),
                                ),
                                floatingLabelStyle:
                                TextStyle(color: Color(0xff339D44)),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color(0xff339D44),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color(0xffD4D4D4),
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                            ),
                            SizedBox(height: 20),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Forgot_Password(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Forgot Password?",
                                  style: GoogleFonts.raleway(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff339D44),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            isLoading
                                ? Center(child: CircularProgressIndicator())
                                : Container(
                              width: Screen_width * 0.9,
                              height: Screen_height * 0.07,
                              child: TextButton(
                                onPressed: () async {
                                  if (email_controller.text.isEmpty) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                        content: Text(
                                            "Email Cannot be Empty")));
                                    return;
                                  }
                                  if (pwd_controller.text.isEmpty) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                        content: Text(
                                            "Password Cannot be Empty")));
                                    return;
                                  }
                                  try {
                                    isLoading = true;
                                    setState(() {});
                                    await AuthServices()
                                        .loginUser(
                                      email: email_controller.text,
                                      password: pwd_controller.text,
                                    )
                                        .then((val) {
                                      isLoading = false;
                                      setState(() {});
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              NavigationBottomBar(),
                                        ),
                                      );
                                    });
                                  } catch (e) {
                                    isLoading = false;
                                    setState(() {});
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                        content:
                                        Text("LogIn Failed")));
                                  }
                                },
                                child: Text("Login"),
                                style: TextButton.styleFrom(
                                  backgroundColor: Color(0xff339D44),
                                  foregroundColor: Color(0xffF4F4F4),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 23),
                            Text(
                              "Don't have an account?",
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: Color(0xff292929),
                              ),
                            ),
                            SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Registration1()),
                                );
                              },
                              child: Text(
                                "Sign Up",
                                style: GoogleFonts.raleway(
                                  fontSize: 27,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff339D44),
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                          ],
                        ),
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
