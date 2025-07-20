import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


void show_upoaded_dialog_box(BuildContext context) {
  final screen_width = MediaQuery.of(context).size.width;
  final screen_height = MediaQuery.of(context).size.height;
  showDialog(context: context, builder: (BuildContext context){
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        width: screen_width * 0.9,
        height: screen_height * 0.36,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox( height: screen_height * 0.045,),
            Image.asset("assets/images/dialog.png"),
            SizedBox(height: 24,),
            Text("Uploaded",
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w700,
                  fontSize: 23,
                  color: Color(0xff292929)
              ),
            ),
            SizedBox(height: 9,),
            Text("Video Uploaded",
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: Color(0xffB4B4B4)
              ),
            ),
            SizedBox(height: 24,),
            Container(

              width: screen_width * 0.6,
              height: screen_height * 0.07,
              child: TextButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text("View Videos"),
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff339D44),
                    foregroundColor: Color(0xffF4F4F4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  });
}