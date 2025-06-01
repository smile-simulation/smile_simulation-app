// lib/features/reminders/presentation/views/widgets/time_and_quantity_section.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:smile_simulation/features/reminders/presentation/views/widgets/custome_drop_down_container.dart';
import 'dart:developer';

class TimeAndQuantitySection extends StatefulWidget {
  final TextEditingController frequencyController;
  final TextEditingController timeController;
  final String? dosage;
  final void Function(String?) onDosageChanged;
  final VoidCallback? onDelete;
  final VoidCallback? onTimeTap;

  const TimeAndQuantitySection({
    super.key,
    required this.frequencyController,
    required this.timeController,
    required this.dosage,
    required this.onDosageChanged,
    this.onDelete,
    this.onTimeTap,
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

  bool _isValidTime(String time) {
    if (time.isEmpty) {
      log('Time validation failed: Empty time');
      return false;
    }
    try {
      DateFormat.jm('ar').parse(time);
      log('Time validation passed: $time');
      return true;
    } catch (e) {
      log('Time validation failed: $time, error: $e');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Time section
          Expanded(
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
                          keyboardType: TextInputType.none,
                          onTap: widget.onTimeTap,
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
                          style: const TextStyle(height: 1.3, color: Colors.grey),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'الرجاء إدخال الوقت';
                            }
                            if (!_isValidTime(value)) {
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
          Expanded(
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

          // Optional Delete icon
          if (widget.onDelete != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
              child: GestureDetector(
                onTap: () async {
                  final confirm = await _showDeleteConfirmationDialog(context);
                  if (confirm == true) {
                    widget.onDelete!();
                  }
                },
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
      ),
    );
  }
}
