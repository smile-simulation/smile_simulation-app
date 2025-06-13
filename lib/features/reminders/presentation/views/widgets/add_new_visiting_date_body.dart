import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:path_provider/path_provider.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/core/widgets/custom_text_field.dart';
import 'package:smile_simulation/features/reminders/data/models/visist_reminder.dart';
import 'package:smile_simulation/generated/l10n.dart';
import 'package:uuid/uuid.dart';

class AddNewVisitingDateBody extends StatefulWidget {
  final VisitReminder? reminder;

  const AddNewVisitingDateBody({super.key, this.reminder});

  @override
  State<AddNewVisitingDateBody> createState() => _AddNewVisitingDateBodyState();
}

class _AddNewVisitingDateBodyState extends State<AddNewVisitingDateBody> {
  late TextEditingController nameController;
  late TextEditingController dateController;
  late TextEditingController timeController;
  late String? imagePath;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.reminder?.name ?? '');
    dateController = TextEditingController(text: widget.reminder?.date ?? '');
    timeController = TextEditingController(text: widget.reminder?.time ?? '');
    imagePath = widget.reminder?.imagePath;
  }

  @override
  void dispose() {
    nameController.dispose();
    dateController.dispose();
    timeController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime initialDate = DateTime.now();
    if (dateController.text.isNotEmpty) {
      try {
        initialDate = DateFormat('yyyy-MM-dd').parse(dateController.text);
      } catch (e) {
        log('Error parsing initial date: $e');
      }
    }

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (context, child) => child!,
    );
    if (picked != null && mounted) {
      setState(() {
        dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay initialTime = TimeOfDay.now();
    if (timeController.text.isNotEmpty) {
      try {
        final parsedTime = DateFormat.jm('ar').parse(timeController.text);
        initialTime = TimeOfDay.fromDateTime(parsedTime);
      } catch (e) {
        log('Error parsing initial time: $e');
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
      setState(() {
        timeController.text = DateFormat.jm('ar').format(selectedTime);
      });
    }
  }

  Future<bool?> _showDeleteConfirmationDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('تأكيد الحذف'),
            content: Text(
              'هل أنت متأكد من حذف تذكير الزيارة "${nameController.text}"؟',
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

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: customAppbar(
        context,
        title: S.of(context).visitSchedules,
        isBack: true,
      ),
      body: CustomBodyScreen(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).addVisitSchedulesInstruction,
                  style: AppTextStyles.style16W400(context),
                ),
                SizedBox(height: screenHeight * 0.06),
                // CameraSection(
                //   medicineNameController: nameController,
                //   onImagePicked: (path) => setState(() => imagePath = path),
                // ),
                // SizedBox(height: screenHeight * 0.03),
                Text(
                  S.of(context).visitName,
                  style: AppTextStyles.subTitle2(context),
                ),
                SizedBox(height: screenHeight * 0.007),
                CustomTextField(
                  hintText: S.of(context).visitName,
                  keyboardType: TextInputType.text,
                  controller: nameController,
                  fillColor: Colors.white,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).field_required;
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.03),
                Text(
                  S.of(context).date,
                  style: AppTextStyles.subTitle2(context),
                ),
                SizedBox(height: screenHeight * 0.007),
                CustomTextField(
                  hintText: S.of(context).date,
                  keyboardType: TextInputType.none,
                  controller: dateController,
                  suffixIcon: const Icon(Icons.calendar_today_outlined),
                  fillColor: Colors.white,
                  readOnly: true,
                  onTap: () => _selectDate(context),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).field_required;
                    }
                    try {
                      DateFormat('yyyy-MM-dd').parse(value);
                      return null;
                    } catch (e) {
                      return 'تاريخ غير صالح';
                    }
                  },
                ),
                SizedBox(height: screenHeight * 0.03),
                Text(
                  S.of(context).time,
                  style: AppTextStyles.subTitle2(context),
                ),
                SizedBox(height: screenHeight * 0.007),
                CustomTextField(
                  hintText: S.of(context).time,
                  keyboardType: TextInputType.none,
                  controller: timeController,
                  suffixIcon: const Icon(Icons.access_time),
                  fillColor: Colors.white,
                  readOnly: true,
                  onTap: () => _selectTime(context),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).field_required;
                    }
                    try {
                      DateFormat.jm('ar').parse(value);
                      return null;
                    } catch (e) {
                      return 'وقت غير صالح';
                    }
                  },
                ),
                SizedBox(height: screenHeight * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomButton(
                        title:
                            widget.reminder == null
                                ? S.of(context).addNewReminder
                                : S.of(context).edit,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final savedImagePath = await _saveImage(imagePath);
                            final updatedReminder = VisitReminder(
                              id: widget.reminder?.id ?? const Uuid().v4(),
                              name: nameController.text,
                              date: dateController.text,
                              time: timeController.text,
                              imagePath: savedImagePath ?? imagePath,
                            );
                            log(
                              'Returning new reminder: ${updatedReminder.toJson()}',
                            );
                            Navigator.of(context).pop(updatedReminder);
                          }
                        },
                      ),
                    ),
                    if (widget.reminder != null) ...[
                      const SizedBox(width: 16),
                      Expanded(
                        child: CustomButton(
                          title: 'حذف الزيارة',
                          onPressed: () async {
                            final confirm = await _showDeleteConfirmationDialog(
                              context,
                            );
                            if (confirm == true) {
                              Navigator.of(
                                context,
                              ).pop({'delete': widget.reminder!.id});
                            }
                          },
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
