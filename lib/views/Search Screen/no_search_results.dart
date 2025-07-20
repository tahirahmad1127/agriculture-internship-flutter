import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoSearchResults extends StatelessWidget {
  const NoSearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    final Screen_height = MediaQuery.of(context).size.height;
    final Screen_width = MediaQuery.of(context).size.width;
    TextEditingController _searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title:
          Padding(
            padding:  EdgeInsets.only(left: Screen_height * 0.02),
            child: Text("Questions",
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w700,
                  fontSize: 23,
                  color: Color(0xff292929)
              ),
            ),
          ),
          actions : [
            Padding(
              padding:  EdgeInsets.only(right: Screen_width * 0.03),
              child: IconButton(onPressed: (){}, icon: Icon(
                Icons.close,
                color: Color(0xff339D44),
              )),
            ),
          ]
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: Screen_width * 0.09 ),
                  child: TextFormField(
                      controller: _searchController,
                      maxLines: 1,
                      decoration: InputDecoration(
                          labelText: "Vehicle Engine",
                          alignLabelWithHint: true,
                          labelStyle: GoogleFonts.raleway(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffB4B4B4),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Color(0xffB4B4B4))
                          )
                      )
                  ),
                ),
                SizedBox(height: Screen_height * 0.05,),
                Stack(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top: Screen_height * 0.3),
                      child: Image.asset("assets/images/no_data_found.png"),
                    ),
                    Column(
                      children: [
                        Center(
                            child: Padding(
                              padding:  EdgeInsets.only(top: Screen_height * 0.1),
                              child: Image.asset("assets/images/no_data_found_2.png"),
                            )
                        ),
                        SizedBox(
                          height: Screen_height * 0.05,
                        ),
                        Text("No Data Found",
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w500,
                              fontSize: 23,
                              color: Color(0xff292929)
                          ),
                        ),
                        Container(
                          width: Screen_width * 0.6,
                          child: Align(
                            child: Text("You have not answered any questions yet",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Color(0xffB4B4B4)
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
