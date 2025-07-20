import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GreenDiaglogBox extends StatefulWidget {
  const GreenDiaglogBox({super.key});

  @override
  State<GreenDiaglogBox> createState() => _GreenDiaglogBoxState();
}

class _GreenDiaglogBoxState extends State<GreenDiaglogBox> {
  @override

  void initState() {
    super.initState();
    /// for loading the first page before the initstate
    WidgetsBinding.instance.addPostFrameCallback((_)  {
      show_exit_dialog_box(context);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff339D44),
    );
  }
}

void show_exit_dialog_box (BuildContext context) {
  final screen_height = MediaQuery.of(context).size.height;
  final screen_width = MediaQuery.of(context).size.width;

  showDialog(context: context,
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      builder: (BuildContext context){
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        width: screen_width * 0.95,
        height: screen_height * 0.30,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: screen_width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox( height: screen_height * 0.045,),
              Text("Exit App?",
                style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w700,
                    fontSize: 23,
                    color: Color(0xff292929)
                ),
              ),
              SizedBox(height: 9,),
             Text("Press back again\nif you want to exit the app",
                  style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: Color(0xffB4B4B4)
                  ),
               textAlign: TextAlign.center,
                ),

              SizedBox(height: 24,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: screen_width * 0.32,
                    height: screen_height * 0.07,
                    child: TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text("Yes"),
                      style: TextButton.styleFrom(
                          backgroundColor: Color(0xff339D44),
                          foregroundColor: Color(0xffF4F4F4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                    ),
                  ),
                  Container(
                    width: screen_width * 0.32,
                    height: screen_height * 0.07,
                    child: TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text("No"),
                      style: TextButton.styleFrom(
                          backgroundColor: Color(0xffF4F4F4),
                          foregroundColor: Color(0xff292929),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  });
}