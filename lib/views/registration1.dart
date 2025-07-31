import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_task_1/services/auth.dart';
import 'package:internship_task_1/views/login.dart';
import 'package:internship_task_1/views/registration2.dart';
import 'package:provider/provider.dart';
import 'package:internship_task_1/Providers/user_registration.dart';

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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
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
              ),
            ),

            Positioned.fill(
              top: screenHeight * 0.18,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.06,
                    vertical: screenHeight * 0.06,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Create Account",
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w700,
                              fontSize: 23,
                              color: Color(0xff292929))),
                      SizedBox(height: 7),
                      Text("Login to Access Your Account",
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: Color(0xffB4B4B4))),
                      SizedBox(height: 30),

                      TextFormField(
                        controller: name_controller,
                        decoration: _inputDecoration("Name"),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: email_controller,
                        decoration: _inputDecoration("Email"),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: pwd_controller,
                        decoration: _inputDecoration("Password"),
                        obscureText: true,
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: confirmpwd_controller,
                        decoration: _inputDecoration("Confirm Password"),
                        obscureText: true,
                      ),
                      SizedBox(height: 40),

                      isLoading
                          ? Center(child: CircularProgressIndicator())
                          : SizedBox(
                        width: double.infinity,
                        height: screenHeight * 0.07,
                        child: TextButton(
                          onPressed: _handleSubmit,
                          child: Text("Next"),
                          style: TextButton.styleFrom(
                            backgroundColor: Color(0xff339D44),
                            foregroundColor: Color(0xffF4F4F4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 23),
                      Text("Already have an account?",
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: Color(0xff292929))),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: Text("Login",
                            style: GoogleFonts.raleway(
                                fontSize: 27,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff339D44))),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: GoogleFonts.raleway(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: Color(0xffB4B4B4),
      ),
      floatingLabelStyle: TextStyle(color: Color(0xff339D44)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Color(0xff339D44)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Color(0xffD4D4D4)),
      ),
    );
  }

  void _handleSubmit() async {
    String email = email_controller.text.trim();
    String password = pwd_controller.text.trim();
    String confirmpwd = confirmpwd_controller.text.trim();
    final name = name_controller.text.trim();

    final userProvider =
    Provider.of<UserRegistrationProvider>(context, listen: false);
    userProvider.setName(name);
    userProvider.setEmail(email);

    if (!userCreated) {
      if (name.isEmpty || email.isEmpty || password.isEmpty || confirmpwd.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please fill in all fields")),
        );
        return;
      }
      if (password != confirmpwd) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Passwords do not match")),
        );
        return;
      }
      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(email)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please enter a valid email")),
        );
        return;
      }
      if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$')
          .hasMatch(password)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Password must be strong")),
        );
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
              content: Text("A verification link has been sent to your email."),
            );
          },
        );
      } catch (e) {
        isLoading = false;
        setState(() {});
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    } else {
      User? currentUser = FirebaseAuth.instance.currentUser;
      await currentUser?.reload();
      if (currentUser != null && currentUser.emailVerified) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Registration2()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please verify your email first")),
        );
      }
    }
  }
}
