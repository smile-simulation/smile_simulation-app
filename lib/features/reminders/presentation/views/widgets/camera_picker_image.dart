import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraPickerWidget extends StatefulWidget {
  final double width;
  final double height;

  const CameraPickerWidget({super.key, this.width = 80, this.height = 80});

  @override
  State<CameraPickerWidget> createState() => _CameraPickerWidgetState();
}

class _CameraPickerWidgetState extends State<CameraPickerWidget> {
  File? _imageFile;

  Future<void> _takePicture() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _takePicture,
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child:
            _imageFile != null
                ? Image.file(
                  _imageFile!,
                  fit: BoxFit.cover, // الصورة تملأ المكان المحدد
                )
                : Image.asset(
                  'assets/images/camera.png',
                  fit: BoxFit.cover, // نفس الشيء لصورة الكاميرا
                ),
      ),
    );
  }
}
