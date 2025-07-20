import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Forgot_Password extends StatelessWidget {
  Forgot_Password({super.key});

  TextEditingController name_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController pwd_controller = TextEditingController();
  TextEditingController confirmpwd_controller = TextEditingController();

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
                      "assets/images/login.png",
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )),
                Positioned(
                  top: Screen_height * 0.33,
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
                            "Forgot Password",
                            style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w700,
                              fontSize: 23,
                              color: Color(0xff292929),
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Container(
                            width: Screen_width * 0.6,
                            child: Text(
                              "Enter your registered email below we'll send you a reset link",
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: Color(0xffB4B4B4),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: name_controller,
                            decoration: InputDecoration(
                              hintText: "yourEmail@email.com",
                              hintStyle: GoogleFonts.raleway(
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
                            height: Screen_height * 0.3,
                          ),
                          Container(
                            width: Screen_width * 0.9,
                            height: Screen_height * 0.07,
                            child: TextButton(
                              onPressed: () {},
                              child: Text("Get Link"),
                              style: TextButton.styleFrom(
                                  backgroundColor: Color(0xff339D44),
                                  foregroundColor: Color(0xffF4F4F4),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                          ),
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
