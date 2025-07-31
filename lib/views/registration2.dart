import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_task_1/views/account_created.dart';
import 'package:internship_task_1/views/registration1.dart';
import 'package:provider/provider.dart';
import 'package:internship_task_1/Providers/user_registration.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internship_task_1/services/ImageUpload.dart';

class Registration2 extends StatefulWidget {
   Registration2({super.key});

   @override
  State<Registration2> createState() => _Registration2State();
}

File? profileImageFile;
File? degreeImageFile;

String? profileImageUrl;
String? degreeImageUrl;


class _Registration2State extends State<Registration2> {
  String? selectedValue;
  List<String> items = [];
  bool isLoading = false;
  TextEditingController qualification_controller = TextEditingController();
  TextEditingController address_controller = TextEditingController();
  TextEditingController contact_controller = TextEditingController();

  @override
  void initState(){
    super.initState();
    isLoading = true;
    fetchExpertise();
  }


  Future<void> fetchExpertise() async {
    print("Fetching expertise...");
    try {
      final snapshot = await FirebaseFirestore.instance.collection('expertise_list').get();
      final List<String> loadedItems = [];

      for (var doc in snapshot.docs) {
        loadedItems.add(doc['name']);
      }

      setState(() {
        items = loadedItems;
        isLoading = false;
      });
      print("Loaded items: $items");
    } catch (e) {
      print("Error fetching expertise: $e");
      setState(() {
        isLoading = false;
      });
    }
  }


Future<void> pickAndUploadProfileImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if(pickedFile != null){
      final file =File(pickedFile.path);
      final url = await ImageUploadService.uploadImageToImgbb(file);
      if(url != null){
        setState(() {
          profileImageFile=file;
          profileImageUrl=url;
        });
      }
    }
}

Future<void> pickAndUploadDegreeImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if(pickedFile != null){
      final file = File(pickedFile.path);
      final url = await ImageUploadService.uploadImageToImgbb(file);
      if(url != null){
        setState(() {
          degreeImageFile = file;
          degreeImageUrl = url;
        });
      }
    }
}
  @override
  Widget build(BuildContext context) {
    final screen_width = MediaQuery.of(context).size.width;
    final screen_height = MediaQuery.of(context).size.height;

    final userProvider = Provider.of<UserRegistrationProvider>(context);
    final name = userProvider.name;
    final email = userProvider.email;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(left: screen_width * 0.07, right: screen_width * 0.07, top: screen_height * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Personal Details",
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.w700,
                fontSize: 23,
                color: Color(0xff292929),
              ),
              ),
              SizedBox(height: 7,),
              Text("Enter your personal details",
                style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: Color(0xffB4B4B4),
                ),
              ),
              SizedBox(height: 30,),
              DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(10),
                  dashPattern: [9,9],
                  color: Color(0xff339D44),
                  child: Container(
                    width: screen_width * 0.9,
                height: screen_height * 0.06,
                child: Padding(
                  padding:  EdgeInsets.only(left: screen_width * 0.02, right: screen_width * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Upload Profile Image",
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Color(0xff292929),
                        ),
                      ),
                    IconButton(onPressed: pickAndUploadProfileImage, icon: Image.asset("assets/images/upload.png"))
                    ],
                  ),
                ),
              )),
              SizedBox(height: 20,),
              Container(
                width: screen_width * 0.9,
                height: screen_height * 0.065,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),

                  border: Border.all(
                    color: Color(0xffD4D4D4)
                  )
                ),
                child: Padding(
                  padding:  EdgeInsets.only(left: screen_width * 0.02, right: screen_width * 0.02),
                  child: DropdownButtonHideUnderline(
                      child:
                      isLoading
                          ? SizedBox(
                        width: double.infinity,
                        child: Center(child: CircularProgressIndicator()),
                      )
                          :

                    DropdownButton<String>(
                      isExpanded: true,
                      value: selectedValue,
                      hint: Text("Choose Experties",
                      style: GoogleFonts.raleway(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffB4B4B4),
                      ),
                      ),
                        icon : Icon(Icons.arrow_drop_down,
                          color: Color(0xffD4D4D4),
                        ),
                          items : items.map((String value){
                            return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,
                                style: GoogleFonts.raleway(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffB4B4B4),
                                ),
                                ),
                            );
                          }).toList(),
                          onChanged: (value){
                          setState(() {
                            selectedValue = value!;
                          });
                          }
                        )
                      ),
                ),
                  ),
          SizedBox(height: 20,),
          Container(
            width: screen_width * 0.9,
            height: screen_height * 0.065,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: Color(0xffD4D4D4)
                )
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:  EdgeInsets.only(left: screen_width * 0.02, right: screen_width * 0.02),
                child: TextFormField(
                  controller: qualification_controller,
                  decoration: InputDecoration(
                  hintText : "Qualification", hintStyle : GoogleFonts.raleway(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffB4B4B4),
                ),
                    border: InputBorder.none,
                  ),
                        ),
              ),
            ),
          ),
              SizedBox(height: 20,),
              DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(10),
                  dashPattern: [9,9],
                  color: Color(0xff339D44),
                  child: Container(
                    width: screen_width * 0.9,
                    height: screen_height * 0.06,
                    child: Padding(
                      padding:  EdgeInsets.only(left: screen_width * 0.02, right: screen_width * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Upload Latest Degree Image",
                            style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: Color(0xff292929),
                            ),
                          ),
                          IconButton(onPressed: pickAndUploadDegreeImage, icon: Image.asset("assets/images/upload.png"))
                        ],
                      ),
                    ),
                  )),
              SizedBox(height: 20,),
              Container(
                width: screen_width * 0.9,
                height: screen_height * 0.17,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Color(0xffD4D4D4)
                    )
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding:  EdgeInsets.only(left: screen_width * 0.02, right: screen_width * 0.02),
                    child: TextFormField(
                      maxLines: 5,
                      controller: address_controller,
                      decoration: InputDecoration(
                        hintText : "Address", hintStyle : GoogleFonts.raleway(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffB4B4B4),
                      ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: screen_width * 0.9,
                height: screen_height * 0.065,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Color(0xffD4D4D4)
                    )
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:  EdgeInsets.only(left: screen_width * 0.02, right: screen_width * 0.02),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: contact_controller,
                      decoration: InputDecoration(
                        hintText : "Contact", hintStyle : GoogleFonts.raleway(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffB4B4B4),
                      ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 47,),
              Container(

                width: screen_width * 0.9,
                height: screen_height * 0.07,
                child: TextButton(
                  onPressed: () async{
                    final uid = FirebaseAuth.instance.currentUser?.uid;
                    if(uid == null) return;
                    await FirebaseFirestore.instance.collection('users').doc(uid).set({
                      'name' : name,
                      'email' : email,
                      'expertise' : selectedValue,
                      'qualification' : qualification_controller.text,
                      'address' : address_controller.text,
                      'contact' : contact_controller.text.toString(),
                      'profileImage' : profileImageUrl ?? '',
                      'degreeImage' : degreeImageUrl ?? '',
                    },
                    SetOptions(merge: true));
                    show_dialog_box(context);
                  },

                  child: Text("Next"),
                  style: TextButton.styleFrom(
                      backgroundColor: Color(0xff339D44),
                      foregroundColor: Color(0xffF4F4F4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                  ),
                ),
              ),
              SizedBox(height : 19),
          TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Registration1()));
                    },
                    child: Text(
                      "Back",
                      style: GoogleFonts.raleway(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff339D44),
                      ),
                    ),
                  ),


            ],
          ),
        ),
      ),
    );
  }
}
