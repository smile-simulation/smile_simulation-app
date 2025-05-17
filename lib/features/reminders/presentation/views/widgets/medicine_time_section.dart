import 'package:flutter/material.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/custome_drop_down_container.dart';

class MedicineTimeSection extends StatelessWidget {
  final String? selectedTime;
  final Function(String?) onChanged;
  final List<String> items; // ✅ قائمة العناصر المتغيرة
  final String title; // ✅ العنوان متغير كمان (اختياري)

  const MedicineTimeSection({
    Key? key,
    required this.selectedTime,
    required this.onChanged,
    required this.items,
    this.title = "وقت تناول الدواء", // قيمة افتراضية
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 12),
          CustomDropdownContainer(
            value: selectedTime,
            onChanged: onChanged,
            items: items,
          ),
        ],
      ),
    );
  }
}
