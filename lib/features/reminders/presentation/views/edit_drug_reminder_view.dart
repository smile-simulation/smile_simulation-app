import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:path_provider/path_provider.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/core/widgets/custom_text_field.dart';
import 'package:smile_simulation/features/reminders/data/models/drug_reminder.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/camera_section.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/custome_drop_down_container.dart';
import 'package:smile_simulation/generated/l10n.dart';
import 'package:uuid/uuid.dart';

class EditDrugReminderView extends StatelessWidget {
  final DrugReminder? reminder;

  const EditDrugReminderView({super.key, this.reminder});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        context,
        title: S.of(context).medicineReminder,
        isBack: true,
      ),
      body: EditDrugReminderViewBody(reminder: reminder),
    );
  }
}

class EditDrugReminderViewBody extends StatefulWidget {
  final DrugReminder? reminder;

  const EditDrugReminderViewBody({super.key, this.reminder});

  @override
  State<EditDrugReminderViewBody> createState() =>
      _EditDrugReminderViewBodyState();
}

class _EditDrugReminderViewBodyState extends State<EditDrugReminderViewBody> {
  late TextEditingController drugNameController;
  late TextEditingController frequencyController;
  late TextEditingController timeController;
  late TextEditingController mealTimingController;
  late String? dosage;
  late String? stopDate;
  late String? imagePath;
  late List<bool> daysSelected;

  @override
  void initState() {
    super.initState();
    drugNameController = TextEditingController(
      text: widget.reminder?.drugName ?? '',
    );
    frequencyController = TextEditingController(
      text: widget.reminder?.frequency ?? '',
    );
    timeController = TextEditingController(text: widget.reminder?.time ?? '');
    mealTimingController = TextEditingController(
      text: widget.reminder?.mealTiming ?? '',
    );
    dosage = widget.reminder?.dosage ?? 'معلقة';
    stopDate = widget.reminder?.stopDate ?? 'دواء دائم';
    imagePath = widget.reminder?.imagePath;
    daysSelected =
        widget.reminder?.daysSelected ?? List.generate(7, (_) => false);

    // Validate initial time
    if (timeController.text.isNotEmpty && !_isValidTime(timeController.text)) {
      print('Invalid initial time: ${timeController.text}');
      timeController.text = ''; // Clear invalid time
    }
  }

  @override
  void dispose() {
    drugNameController.dispose();
    frequencyController.dispose();
    timeController.dispose();
    mealTimingController.dispose();
    super.dispose();
  }

  Future<bool?> _showDeleteConfirmationDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('تأكيد الحذف'),
            content: Text(
              'هل أنت متأكد من حذف تذكير الدواء "${drugNameController.text}"؟',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(S.of(context).cancel),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('حذف', style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
    );
  }

  Future<String?> _saveImage(String? tempPath) async {
    if (tempPath == null) return null;
    final directory = await getApplicationDocumentsDirectory();
    final fileName = '${const Uuid().v4()}.jpg';
    final newPath = '${directory.path}/$fileName';
    await File(tempPath).copy(newPath);
    return newPath;
  }

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay initialTime = TimeOfDay.now();
    if (timeController.text.isNotEmpty) {
      try {
        final parsedTime = DateFormat.jm('ar').parse(timeController.text);
        initialTime = TimeOfDay.fromDateTime(parsedTime);
      } catch (e) {
        print('Error parsing initial time: ${timeController.text}, error: $e');
        // Use default time if parsing fails
      }
    }

    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: initialTime,
      builder:
          (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child!,
          ),
    );
    if (picked != null && mounted) {
      final now = DateTime.now();
      final selectedTime = DateTime(
        now.year,
        now.month,
        now.day,
        picked.hour,
        picked.minute,
      );
      final formattedTime = DateFormat.jm('ar').format(selectedTime);
      setState(() {
        timeController.text = formattedTime;
        print('Selected edited time: $formattedTime'); // Debug log
      });
    }
  }

  bool _isValidTime(String time) {
    if (time.isEmpty) {
      print('Time is empty'); // Debug log
      return false;
    }
    // Accept both Western and Arabic digits
    final timePattern = RegExp(r'^[0-9٠-٩]{1,2}:[0-9٠-٩]{2}\s*(?:ص|م)$');
    if (!timePattern.hasMatch(time)) {
      print('Invalid time format: $time'); // Debug log
      return false;
    }
    try {
      DateFormat.jm('ar').parse(time);
      return true;
    } catch (e) {
      print('Time parsing error: $e'); // Debug log
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final List<String> dosageItems = [
      S.of(context).spoon,
      S.of(context).pill,
      S.of(context).halfPill,
    ];
    final List<String> stopDateItems = [
      S.of(context).permanentMedicine,
      S.of(context).specificDate,
    ];

    return Column(
      children: [
        Expanded(
          child: CustomBodyScreen(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 18),
                    CameraSection(
                      medicineNameController: drugNameController,
                      onImagePicked: (path) => setState(() => imagePath = path),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      S.of(context).frequency,
                      style: AppTextStyles.subTitle2(context),
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      hintText: '3 مرات يوميا',
                      keyboardType: TextInputType.text,
                      controller: frequencyController,
                      fillColor: Colors.white,
                      borderColor: Colors.grey.shade300,
                    ),
                    const SizedBox(height: 18),
                    Text('الكمية', style: AppTextStyles.subTitle2(context)),
                    const SizedBox(height: 8),
                    CustomDropdownContainer(
                      hint: 'الكمية',
                      value: dosage,
                      items:
                          dosageItems
                              .map(
                                (e) =>
                                    DropdownMenuItem(value: e, child: Text(e)),
                              )
                              .toList(),
                      onChanged: (val) => setState(() => dosage = val),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      'وقت التنبيه',
                      style: AppTextStyles.subTitle2(context),
                    ),
                    const SizedBox(height: 8),
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
                            controller: timeController,
                            readOnly: true,
                            keyboardType: TextInputType.none,
                            onTap: () => _selectTime(context),
                            decoration: InputDecoration(
                              labelText: 'الوقت',
                              labelStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                              border: InputBorder.none,
                              suffixIcon: Image.asset(
                                'assets/images/clock.png',
                                width: 20,
                                height: 20,
                                semanticLabel: 'اختر الوقت',
                              ),
                            ),
                            style: const TextStyle(
                              height: 1.3,
                              color: Colors.grey,
                            ),
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
                    const SizedBox(height: 18),
                    Text(
                      '${S.of(context).medicineTime}:',
                      style: AppTextStyles.subTitle2(context),
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      hintText: S.of(context).beforeMeal,
                      keyboardType: TextInputType.text,
                      controller: mealTimingController,
                      fillColor: Colors.white,
                    ),
                    const SizedBox(height: 18),
                    Text(
                      'تاريخ التوقف عن الدواء',
                      style: AppTextStyles.subTitle2(context),
                    ),
                    const SizedBox(height: 8),
                    CustomDropdownContainer(
                      hint: 'دواء دائم',
                      value: stopDate,
                      items:
                          stopDateItems
                              .map(
                                (e) =>
                                    DropdownMenuItem(value: e, child: Text(e)),
                              )
                              .toList(),
                      onChanged: (val) => setState(() => stopDate = val),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomButton(
                            title: S.of(context).edit,
                            isMinWidth: true,
                            onPressed: () async {
                              if (timeController.text.isEmpty ||
                                  !_isValidTime(timeController.text)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('الرجاء إدخال وقت صحيح'),
                                  ),
                                );
                                return;
                              }
                              final savedImagePath = await _saveImage(
                                imagePath,
                              );
                              final updatedReminder = DrugReminder(
                                id: widget.reminder?.id ?? const Uuid().v4(),
                                drugName: drugNameController.text,
                                frequency: frequencyController.text,
                                dosage: dosage ?? 'معلقة',
                                time: timeController.text,
                                mealTiming: mealTimingController.text,
                                stopDate: stopDate ?? 'دواء دائم',
                                daysSelected: daysSelected,
                                imagePath: savedImagePath ?? imagePath,
                              );
                              Navigator.of(context).pop(updatedReminder);
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CustomButton(
                            title: S.of(context).deleteMedicine,
                            isMinWidth: true,
                            onPressed: () async {
                              final confirm =
                                  await _showDeleteConfirmationDialog(context);
                              if (confirm == true && widget.reminder != null) {
                                Navigator.of(
                                  context,
                                ).pop({'delete': widget.reminder!.id});
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
