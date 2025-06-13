import 'package:flutter/material.dart';
import 'package:smile_simulation/generated/l10n.dart';
import 'camera_picker_image.dart';

class CameraSection extends StatelessWidget {
  final TextEditingController medicineNameController;
  final void Function(String?)? onImagePicked;

  const CameraSection({
    super.key,
    required this.medicineNameController,
    this.onImagePicked,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              CameraPickerWidget(
                width: 80,
                height: 80,
                onImagePicked: onImagePicked,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).medicineName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 6),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: TextField(
                        controller: medicineNameController,
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          hintText: S.of(context).medicineName,
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
