import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class VideoUploadService {
  final String cloudName = "ddawjlq6x";
  final String uploadPreset = "my_unsigned_upload";

  Future<String?> uploadMedia(File file) async {
    final uri = Uri.parse(
        "https://api.cloudinary.com/v1_1/$cloudName/${_getResourceType(file)}/upload");

    final request = http.MultipartRequest('POST', uri)
      ..fields['upload_preset'] = uploadPreset
      ..files.add(await http.MultipartFile.fromPath('file', file.path));

    final response = await request.send();

    if (response.statusCode == 200) {
      final resStr = await response.stream.bytesToString();
      final jsonRes = jsonDecode(resStr);
      return jsonRes['secure_url'];
    } else {
      print('Failed to upload: ${response.statusCode}');
      return null;
    }
  }

  String _getResourceType(File file) {
    final extension = file.path.split('.').last.toLowerCase();
    return ['mp4', 'mov', 'avi'].contains(extension) ? 'video' : 'image';
  }
}
