import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraSection extends StatefulWidget {
  const CameraSection({Key? key}) : super(key: key);

  @override
  State<CameraSection> createState() => _CameraSectionState();
}

class _CameraSectionState extends State<CameraSection> {
  final TextEditingController _medicineNameController = TextEditingController();
  File? _imageFile;

  @override
  void dispose() {
    _medicineNameController.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    } else {
      print("لم يتم اختيار صورة.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end, // من اليمين للشمال
        children: [
          Row(
            children: [
              // زر الكاميرا
              InkWell(
                onTap: _takePicture,
                child: Center(
                  child:
                      _imageFile != null
                          ? Image.file(_imageFile!, width: 80, height: 140)
                          : Image.asset(
                            'assets/images/camera.png',
                            width: 80,
                            height: 140,
                          ),
                ),
              ),
              const SizedBox(width: 8),
              // حقل اسم الدواء
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'اسم الدواء',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(height: 6),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: TextField(
                        controller: _medicineNameController,
                        textAlign: TextAlign.right,
                        decoration: const InputDecoration(
                          hintText: 'اسم الدواء',
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
