import 'package:image_picker/image_picker.dart';

class FilePickerService {
  Future<Map<String, dynamic>?> pickImage() async {
    try {
      final result = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (result == null) {
        return null; // No file selected
      }

      final imageName = result.name;
      final pickedImage = result.readAsBytes();

      return {'imageName': imageName, 'pickedImage': pickedImage};
    } catch (e) {
      return null; // Error occurred
    }
  }
}
