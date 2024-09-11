import 'dart:io';

import 'package:image_picker/image_picker.dart';

class MyImagePicker {
  Future pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage != null) {
      return returnedImage;
    } else {
      return returnedImage;
    }
  }
}
