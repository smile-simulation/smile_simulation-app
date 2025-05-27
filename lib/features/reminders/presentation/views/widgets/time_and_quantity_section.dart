import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

import 'package:smile_simulation/features/reminders/presentation/views/widgets/custome_drop_down_container.dart';

class TimeAndQuantitySection extends StatefulWidget {
  final TextEditingController frequencyController;
  final TextEditingController timeController;
  final String? dosage;
  final void Function(String?) onDosageChanged;
  final VoidCallback? onDelete;

  const TimeAndQuantitySection({
    super.key,
    required this.frequencyController,
    required this.timeController,
    required this.dosage,
    required this.onDosageChanged,
    this.onDelete,
  });

  @override
  State<TimeAndQuantitySection> createState() => _TimeAndQuantitySectionState();
}

class _TimeAndQuantitySectionState extends State<TimeAndQuantitySection> {
  final List<String> items = ['معلقة', 'حباية', 'نص حباية'];

  Future<bool?> _showDeleteConfirmationDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: const Text('تأكيد الحذف'),
          content: const Text('هل أنت متأكد من حذف هذا التذكير؟'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('إلغاء'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('حذف', style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) => Directionality(
        textDirection: TextDirection.rtl,
        child: child!,
      ),
    );
    if (picked != null && mounted) {
      final now = DateTime.now();
      final selectedTime = DateTime(now.year, now.month, now.day, picked.hour, picked.minute);
      final formattedTime = DateFormat.jm('ar').format(selectedTime);
      setState(() {
        widget.timeController.text = formattedTime;
      });
    }
  }

  bool _isValidTime(String time) {
    try {
      DateFormat.jm('ar').parse(time);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Time section
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'الوقت',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 12),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Center(
                    child: Semantics(
                      label: 'إدخال الوقت',
                      child: TextFormField(
                        controller: widget.timeController,
                        readOnly: true,
                        onTap: () => _selectTime(context),
                        decoration: InputDecoration(
                          labelText: 'الوقت',
                          labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                          border: InputBorder.none,
                          suffixIcon: Image.asset(
                            'assets/images/clock.png',
                            width: 20,
                            height: 20,
                            semanticLabel: 'اختر الوقت',
                          ),
                        ),
                        keyboardType: TextInputType.datetime,
                        style: const TextStyle(height: 1.3, color: Colors.grey),
                        validator: (value) {
                          if (value != null && value.isNotEmpty && !_isValidTime(value)) {
                            return 'تنسيق الوقت غير صحيح';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Quantity section
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'الكمية',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 12),
                CustomDropdownContainer(
                  hint: 'الكمية',
                  value: widget.dosage,
                  items: items
                      .map((e) => DropdownMenuItem<String>(value: e, child: Text(e)))
                      .toList(),
                  onChanged: widget.onDosageChanged,
                ),
              ],
            ),
          ),
        ),

        // Delete icon
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 40, 0, 0),
          child: GestureDetector(
            onTap: widget.onDelete != null
                ? () async {
                    final confirm = await _showDeleteConfirmationDialog(context);
                    if (confirm == true) {
                      widget.onDelete!();
                    }
                  }
                : null,
            child: Tooltip(
              message: 'حذف التذكير',
              child: Image.asset(
                'assets/images/delete.png',
                width: 40,
                height: 40,
                semanticLabel: 'حذف التذكير',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
