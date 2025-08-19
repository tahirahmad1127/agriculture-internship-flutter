import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:internship_task_1/models/user_model.dart';
import 'package:internship_task_1/services/ImageUpload.dart';

class UserServices {
  Future<void> updateTask(UserModel model, {File? newImage}) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    String? imageUrl = model.profileImage;

    if (newImage != null) {
      final uploadedUrl = await ImageUploadService.uploadImageToImgbb(newImage);
      if (uploadedUrl != null) {
        imageUrl = uploadedUrl;
      }
    }

    await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
      "name": model.name,
      "profileImage": imageUrl,
    });
  }
}
