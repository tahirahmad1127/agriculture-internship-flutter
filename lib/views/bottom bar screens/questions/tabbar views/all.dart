import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/questions/Answer%20Screen/answer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class All extends StatefulWidget {
  const All({super.key});

  @override
  State<All> createState() => _AllState();
}

PageController _controller = PageController();
List<String> images = [
  "assets/images/tractor.png",
  "assets/images/tractor.png",
  "assets/images/tractor.png",
  "assets/images/tractor.png",
  "assets/images/tractor.png",
  "assets/images/tractor.png",
  "assets/images/tractor.png",
];

class _AllState extends State<All> {
  @override
  Widget build(BuildContext context) {
    final Screen_height = MediaQuery.of(context).size.height;
    final Screen_width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Screen_height * 0.04),
            child: Row(
              children: [
                Image.asset("assets/images/fareeha.png"),
                SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Fareeha Sadaqat",
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w500,
                              fontSize: 11,
                              color: Color(0xff292929)),
                        ),
                        SizedBox(
                          width: Screen_width * 0.30,
                        ),
                        TextButton(
                          onPressed:(){
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Answer(),
                            ));
                          },
                          child:Text(
                          "Answer",
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                              color: Color(0xff339D44)),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "10 mins ago",
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w400,
                          fontSize: 9,
                          color: Color(0xffB4B4B4)),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: Screen_height * 0.03,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Screen_height * 0.04),
            child: Text(
              "I have an issue regarding this vehicle",
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: Color(0xff292929)),
            ),
          ),
          SizedBox(
            height: Screen_height * 0.02,
          ),
          SizedBox(
            height: Screen_height * 0.25,
            child: Stack(alignment: Alignment.bottomCenter, children: [
              PageView.builder(
                  controller: _controller,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(images[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }),
              Padding(
                padding: EdgeInsets.only(bottom: Screen_height * 0.01),
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: images.length,
                  effect: WormEffect(
                      dotHeight: 6,
                      dotWidth: 6,
                      dotColor: Color(0xffFFFFFF).withOpacity(0.7),
                      activeDotColor: Color(0xffFFFFFF)),
                ),
              ),
            ]),
          ),
          SizedBox(
            height: Screen_height * 0.05,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Screen_height * 0.04),
                child: Row(
                  children: [
                    Image.asset("assets/images/ali.png"),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Muhammad Ali Nizami",
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11,
                                  color: Color(0xff292929)),
                            ),
                            SizedBox(
                              width: Screen_width * 0.20,
                            ),
                            TextButton(
                              onPressed:(){
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => Answer(),
                                ));
                              },
                              child:Text(
                                "Answer",
                                style: GoogleFonts.raleway(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11,
                                    color: Color(0xff339D44)),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "20 mins ago",
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w400,
                              fontSize: 9,
                              color: Color(0xffB4B4B4)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Screen_height * 0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Screen_height * 0.04),
                child: Text(
                  "What is the process of purchasing Vehicle from hardware store?",
                  style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Color(0xff292929)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: Screen_height * 0.05,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Screen_height * 0.04),
                child: Row(
                  children: [
                    Image.asset("assets/images/masab.png"),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Masab Mehmood",
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11,
                                  color: Color(0xff292929)),
                            ),
                            SizedBox(
                              width: Screen_width * 0.30,
                            ),
                            TextButton(
                              onPressed:(){
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => Answer(),
                                ));
                              },
                              child:Text(
                                "Answer",
                                style: GoogleFonts.raleway(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11,
                                    color: Color(0xff339D44)),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "15 mins ago",
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w400,
                              fontSize: 9,
                              color: Color(0xffB4B4B4)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Screen_height * 0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Screen_height * 0.04),
                child: Text(
                  "What is the process of purchasing Vehicle from hardware store?",
                  style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Color(0xff292929)),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
