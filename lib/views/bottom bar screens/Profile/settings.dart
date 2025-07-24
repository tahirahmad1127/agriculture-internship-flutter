import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/Profile/profile.dart';
import 'package:internship_task_1/views/verification_code.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final Screen_height = MediaQuery.of(context).size.height;
    final Screen_width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        elevation: 0,
        shadowColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xff339D44),
            )),
        title: Padding(
          padding: EdgeInsets.only(
              left: Screen_height * 0.02, right: Screen_height * 0.02),
          child: Text(
            "Settings",
            style: GoogleFonts.raleway(
                fontWeight: FontWeight.w700,
                fontSize: 23,
                color: Color(0xff292929)),
          ),
        ),
      ),
      body: Column(
         children: [
           Divider(
             color: Color(0xffD4D4D4).withOpacity(0.2),
           ),
           Padding(
             padding:  EdgeInsets.symmetric(horizontal: Screen_width * 0.07),
             child: Column(
               children: [
                 InkWell(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
                   },
                   child: Container(
                     child: Row(
                       children: [
                         Text("Account",
                         style: GoogleFonts.raleway(
                           fontSize: 13,
                           fontWeight: FontWeight.w500,
                           color: Color(0xff000000)
                         ),
                         ),
                         Spacer(),
                         Icon(Icons.arrow_forward_ios,
                         size: Screen_width * 0.05,
                         color: Color(0xffD4D4D4),
                         )
                       ],
                     ),
                   ),
                 ),
                 SizedBox(height: Screen_height * 0.05,),
                 InkWell(
                   onTap: (){},
                   child: Container(
                     child: Row(
                       children: [
                         Text("Rate Our App",
                           style: GoogleFonts.raleway(
                               fontSize: 13,
                               fontWeight: FontWeight.w500,
                               color: Color(0xff000000)
                           ),
                         ),
                         Spacer(),
                         Icon(Icons.arrow_forward_ios,
                           size: Screen_width * 0.05,
                           color: Color(0xffD4D4D4),
                         )
                       ],
                     ),
                   ),
                 ),
                 SizedBox(height: Screen_height * 0.05,),
                 InkWell(
                   onTap: (){},
                   child: Container(
                     child: Row(
                       children: [
                         Image.asset("assets/images/logout.png",
                         color: Color(0xffF24E1E),
                         ),
                         SizedBox(width: Screen_width * 0.01,),
                         GestureDetector(
                           onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context)=> GreenDiaglogBox()));

                           },
                           child: Text("Logout",
                             style: GoogleFonts.raleway(
                               fontSize: 13,
                               fontWeight: FontWeight.w700,
                               color: Color(0xffF24E1E),
                             ),
                           ),
                         )

                       ],
                     ),
                   ),
                 )
               ],
             ),
           )
         ],
      ),
    );
  }
}
