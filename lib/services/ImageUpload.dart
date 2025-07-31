import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ImageUploadService {
  static const String imgbbApiKey = "856c22423ffe40e5c23368db3e76b9c8";

  static Future<String?> uploadImageToImgbb(File imageFile) async {
    try {
      final url = Uri.parse("https://api.imgbb.com/1/upload?key=$imgbbApiKey");

      final base64Image = base64Encode(await imageFile.readAsBytes());

      final response = await http.post(
        url,
        body: {
          "image": base64Image,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final imageUrl = data['data']['url'];
        return imageUrl;
      } else {
        print("Failed to upload image: ${response.body}");
        return null;
      }
    } catch (e) {
      print("Error uploading image: $e");
      return null;
    }
  }
}
