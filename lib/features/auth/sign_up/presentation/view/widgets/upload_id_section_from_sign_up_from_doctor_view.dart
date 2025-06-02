import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_text_styles.dart';
import '../../../../../../generated/assets.dart';
import '../../../../../../generated/l10n.dart';

class UploadIDSectionFromSignUpFromDoctorView extends StatefulWidget {
  final Function(File image, bool isDoctor) onImagePicked;

  const UploadIDSectionFromSignUpFromDoctorView({
    super.key,
    required this.onImagePicked,
  });

  @override
  State<UploadIDSectionFromSignUpFromDoctorView> createState() =>
      _UploadIDSectionFromSignUpFromDoctorViewState();
}

class _UploadIDSectionFromSignUpFromDoctorViewState
    extends State<UploadIDSectionFromSignUpFromDoctorView> {
  File? _image;
  String? _scannedText;
  bool? _isDoctor;

  Future<void> _pickImageAndScanText() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      final imageFile = File(pickedImage.path);
      final inputImage = InputImage.fromFile(imageFile);
      final textRecognizer = TextRecognizer();
      final RecognizedText recognizedText = await textRecognizer.processImage(
        inputImage,
      );
      final text = recognizedText.text;

      final keywords = [
        'doctor',
        'dr',
        'dr.',
        'dentist',
        'surgeon',
        'cardiologist',
        'dermatologist',
        'neurologist',
        'pediatrician',
        'psychiatrist',
        'urologist',
        'gynecologist',
        'orthopedic',
        'radiologist',
        'oncologist',
        'general practitioner',
        'GP',
        'ENT',
        'ophthalmologist',
        'internal medicine',
        'family medicine',
        'anesthesiologist',
        'طبيب',
        'طبيبة',
        'الدكتور',
        'دكتور',
        'دكتورة',
        'د /',
        'د.',
        'د ',
        'أ.د',
        'أ. د.',
        'أسنان',
        'جراح',
        'قلب',
        'جلدية',
        'أعصاب',
        'أطفال',
        'نفسية',
        'مسالك بولية',
        'نساء وتوليد',
        'عظام',
        'أشعة',
        'أورام',
        'باطنة',
        'طب الأسرة',
        'تخدير',
        'أنف وأذن وحنجرة',
        'عيون',
      ];

      bool hasKeyword = keywords.any(
        (k) => text.toLowerCase().contains(k.toLowerCase()),
      );

      setState(() {
        _image = imageFile;
        _scannedText = text;
        _isDoctor = hasKeyword;
      });

      widget.onImagePicked(imageFile, hasKeyword);

      textRecognizer.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              S.of(context).uploadIDCard,
              style: AppTextStyles.formLabel(context),
            ),
          ],
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: _pickImageAndScanText,
          child: AspectRatio(
            aspectRatio: 2,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.veryLightGreyColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child:
                  _image != null
                      ? ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          _image!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      )
                      : Center(
                        child: SvgPicture.asset(Assets.imagesScanCamera),
                      ),
            ),
          ),
        ),
        // if (_scannedText != null)
        //   Padding(
        //     padding: const EdgeInsets.only(top: 12),
        //     child: Text(
        //       _isDoctor == true
        //           ? "✅ تم التعرف على بطاقة طبيب"
        //           : "❌ لم يتم التعرف على بطاقة طبيب",
        //       style: TextStyle(
        //         color: _isDoctor == true ? Colors.green : Colors.red,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     ),
        //   ),
      ],
    );
  }
}
