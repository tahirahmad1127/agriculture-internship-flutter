import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

import 'package:internship_task_1/models/user_model.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/Profile/profile.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/Profile/settings.dart';
import '../../../services/user.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String? _profileImage; // URL from Firestore
  File? _newImageFile; // Picked new image

  final UserServices _userServices = UserServices();

  @override
  void initState() {
    super.initState();
    _loadCurrentUserData();
  }

  Future<void> _loadCurrentUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final snapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .get();

      final userData = snapshot.data();

      setState(() {
        _nameController.text = userData?["name"] ?? user.displayName ?? "";
        _emailController.text = userData?["email"] ?? user.email ?? "";
        _profileImage = userData?["profileImage"];
      });
    }
  }


  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _newImageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _saveProfile() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final model = UserModel(
      docId: user.uid,
      name: _nameController.text.trim(),
      profileImage: _profileImage ?? "",
    );

    await _userServices.updateTask(model, newImage: _newImageFile);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Profile()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xff339D44),
          ),
        ),
        elevation: 0,
        shadowColor: Colors.transparent,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenHeight * 0.02),
          child: Text(
            "Edit Profile",
            style: GoogleFonts.raleway(
              fontWeight: FontWeight.w700,
              fontSize: 23,
              color: const Color(0xff292929),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: screenHeight * 0.115,
                width: screenWidth * 0.24,
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: screenWidth * 0.11,
                      backgroundImage: _newImageFile != null
                          ? FileImage(_newImageFile!)
                          : (_profileImage != null && _profileImage!.isNotEmpty
                          ? NetworkImage(_profileImage!)
                          : const AssetImage("assets/images/profile_image.png"))
                      as ImageProvider,
                    ),

                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: screenHeight * 0.040,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff339D44),
                        ),
                        child: IconButton(
                          onPressed: _pickImage,
                          icon: Icon(
                            Icons.edit_outlined,
                            size: screenHeight * 0.024,
                            color: const Color(0xffF4F4F4),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Name",
                labelStyle: GoogleFonts.raleway(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xffB4B4B4),
                ),
                floatingLabelStyle: const TextStyle(color: Color(0xff339D44)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xff339D44)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xffD4D4D4)),
                ),
              ),
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: screenHeight * 0.03),
            TextFormField(
              controller: _emailController,
              readOnly: true,
              enabled: false,
              showCursor: false,
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: GoogleFonts.raleway(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xffB4B4B4),
                ),
                floatingLabelStyle: const TextStyle(color: Color(0xff339D44)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xff339D44)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xffD4D4D4)),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.06,
            right: screenWidth * 0.06,
            bottom: screenHeight * 0.02,
          ),
          child: SizedBox(
            width: screenWidth * 0.9,
            height: screenHeight * 0.07,
            child: TextButton(
              onPressed: _saveProfile,
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xff339D44),
                foregroundColor: const Color(0xffF4F4F4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text("Save Changes"),
            ),
          ),
        ),
      ),
    );
  }
}
