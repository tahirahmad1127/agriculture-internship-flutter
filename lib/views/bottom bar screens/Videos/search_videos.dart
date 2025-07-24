import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_task_1/models/video_model.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/Videos/comments.dart';

class SearchVideos extends StatefulWidget {
  SearchVideos({super.key});

  @override
  State<SearchVideos> createState() => _SearchVideosState();
}

class _SearchVideosState extends State<SearchVideos> {
  TextEditingController _searchController = TextEditingController();
  List<VideoModel> videoItems = [
    VideoModel(
        title: "How to Start A Tractor",
        uploadDate: "15 mins ago",
        video: "assets/images/video1.png",
        views: 139,
        saves: 23,
        comments: 2,
        menuIcon: Icons.more_vert,
        commentIcon: Icons.chat_bubble_outline,
        saveIcon: Icons.bookmark_border,
        viewIcon: Icons.remove_red_eye_outlined),
    VideoModel(
        title: "How to buy a Tractor",
        uploadDate: "21 Oct 2021 Monday",
        video: "assets/images/tractor.png",
        views: 100,
        saves: 100,
        comments: 100,
        menuIcon: Icons.more_vert,
        commentIcon: Icons.chat_bubble_outline,
        saveIcon:Icons.bookmark_border,
        viewIcon: Icons.remove_red_eye_outlined)
  ];

  @override
  Widget build(BuildContext context) {
    final Screen_height = MediaQuery.of(context).size.height;
    final Screen_width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
          elevation: 0,
          shadowColor: Colors.transparent,
          title: Padding(
            padding: EdgeInsets.only(
                left: Screen_height * 0.02, right: Screen_height * 0.02),
            child: Text(
              "Training Videos",
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w700,
                  fontSize: 23,
                  color: Color(0xff292929)),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: Screen_width * 0.05),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    color: Color(0xff339D44),
                  )),
            ),
          ]),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Screen_width * 0.09),
            child: TextFormField(
                controller: _searchController,
                maxLines: 1,
                decoration: InputDecoration(
                    labelText: "Tractor",
                    alignLabelWithHint: true,
                    labelStyle: GoogleFonts.raleway(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffB4B4B4),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xffB4B4B4))))),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: videoItems.length,
                itemBuilder: (context, index){
                  return Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left: Screen_width* 0.06, top: Screen_height * 0.03,
                        right: Screen_width * 0.06),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(videoItems[index].title,
                                  style: GoogleFonts.raleway(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff292929),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text("Upload Date",
                                    style: GoogleFonts.raleway(
                                      fontSize: 9,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffB4B4B4),
                                    ),
                                    ),
                                    Text("15 mins ago",
                                      style: GoogleFonts.raleway(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff292929),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            IconButton(onPressed: (){}, icon: Icon(videoItems[index].menuIcon),
                            ),
                        ],
                        ),
                      ),
                  Image.asset(videoItems[index].video),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: Screen_width * 0.06),
                        child: Row(
                          children: [
                            IconButton(onPressed: (){}, icon: Icon(videoItems[index].viewIcon),
                            color: Color(0xffB4B4B4),
                            ),
                            Text(videoItems[index].views.toString(),
                            style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w400,
                              fontSize: 9,
                              color: Color(0xffB4B4B4),
                            ),

                            ),
                            SizedBox(width: Screen_width * 0.01,),

                            Text("Views",
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w400,
                                fontSize: 9,
                                color: Color(0xffB4B4B4),
                              ),
                            ),
                            SizedBox(width: Screen_width * 0.02,),
                            IconButton(onPressed: (){}, icon: Icon(videoItems[index].commentIcon),
                            color: Color(0xffB4B4B4),
                            ),
                            Text(videoItems[index].comments.toString(),
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w400,
                                fontSize: 9,
                                color: Color(0xffB4B4B4),
                              ),
                            ),
                            SizedBox(width: Screen_width * 0.01,),

                            Text("Comments",
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w400,
                                fontSize: 9,
                                color: Color(0xffB4B4B4),
                              ),
                            ),
                            SizedBox(width: Screen_width * 0.02,),

                            IconButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> Comments()));
                            }, icon: Icon(videoItems[index].saveIcon),
                              color: Color(0xffB4B4B4),
                            ),
                            Text(videoItems[index].saves.toString(),
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w400,
                                fontSize: 9,
                                color: Color(0xffB4B4B4),
                              ),
                            ),
                            SizedBox(width: Screen_width * 0.01,),

                            Text("Saves",
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w400,
                                fontSize: 9,
                                color: Color(0xffB4B4B4),
                              ),
                            ),
                          ],
                        ),
                      )
                  ],
                  );
                } ),
          )
        ],
      ),
    );
  }
}
