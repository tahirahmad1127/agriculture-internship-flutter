import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/Profile/settings.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/Videos/uploaded.dart';

class EditProfile extends StatefulWidget {
   EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Screen_height = MediaQuery
        .of(context)
        .size
        .height;
    final Screen_width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(onPressed: (){}, icon:Icon(Icons.arrow_back,
        color: Color(0xff339D44),
        ),
        ),
          elevation: 0,
          shadowColor: Colors.transparent,
          title: Padding(
            padding: EdgeInsets.only(
                left: Screen_height * 0.02, right: Screen_height * 0.02),
            child: Text(
              "Edit Profile",
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w700,
                  fontSize: 23,
                  color: Color(0xff292929)),
            ),
          ),
          ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: Screen_width * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Center(
        child: Container(
          height: Screen_height * 0.115,
          width: Screen_width * 0.24,
          child: Stack(
            children: [
              CircleAvatar(
                radius: Screen_width * 0.11,
                child: Image.asset(
                  "assets/images/profile_image.png",
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                    height: Screen_height * 0.040,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff339D44)
                    ),
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.edit_outlined,
                      size: Screen_height * 0.024,
                      color: Color(0xffF4F4F4),),
                    ),
                  )
              )
            ],
          ),
        ),
            ),
            SizedBox(
              height: Screen_height * 0.03,
            ),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Name",labelStyle: GoogleFonts.raleway(
                  fontSize:11,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffB4B4B4)
              ),
                floatingLabelStyle: TextStyle(
                    color: Color(0xff339D44)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Color(0xff339D44),
                    )
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Color(0xffD4D4D4),
                    )
                ),
              ),
              keyboardType: TextInputType.text,
              obscureText: false,
            ),
            SizedBox(
              height: Screen_height * 0.03,
            ),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: "mwajahat.038@gmail.com",
                hintStyle: GoogleFonts.raleway(
                    fontSize:11,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffB4B4B4)
                ),
                labelText: "Email",labelStyle: GoogleFonts.raleway(
                  fontSize:11,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffB4B4B4)
              ),
                floatingLabelStyle: TextStyle(
                    color: Color(0xff339D44)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Color(0xff339D44),
                    )
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Color(0xffD4D4D4),
                    )
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
            ),
          ]),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: Screen_width * 0.06,
            right: Screen_width * 0.06,
            bottom: Screen_height * 0.02,
          ),
          child: SizedBox(
            width: Screen_width * 0.9,
            height: Screen_height * 0.07,
            child: TextButton(
              onPressed: () {
                show_upoaded_dialog_box(context);
              },
              child: Text("Save Changes"),
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
