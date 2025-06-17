// lib/features/reminders/presentation/views/add_new_drug_view.dart
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:path_provider/path_provider.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/features/reminders/data/models/drug_reminder.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/camera_section.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/date_of_stopping_taking_medicin.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/medicine_time_section.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/repeat_day_section.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/time_and_quantity_section.dart';
import 'package:smile_simulation/generated/l10n.dart';
import 'package:uuid/uuid.dart';

class AddNewDrugView extends StatelessWidget {
  final Function(DrugReminder)? onAddReminder;
  const AddNewDrugView({super.key, this.onAddReminder});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        context,
        title: S.of(context).addMedicine,
        isBack: true,
      ),
      body: AddNewDrugViewBody(onAddReminder: onAddReminder),
    );
  }
}

class AddNewDrugViewBody extends StatefulWidget {
  final Function(DrugReminder)? onAddReminder;
  const AddNewDrugViewBody({super.key, this.onAddReminder});

  @override
  State<AddNewDrugViewBody> createState() => _AddNewDrugViewBodyState();
}

class _AddNewDrugViewBodyState extends State<AddNewDrugViewBody> {
  String? selectedTime;
  List<bool> daysSelected = List.generate(7, (_) => false);
  String? dosage;
  String? stopDate;
  String? imagePath;
  final TextEditingController medicineNameController = TextEditingController();
  final TextEditingController frequencyController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  @override
  void dispose() {
    medicineNameController.dispose();
    frequencyController.dispose();
    timeController.dispose();
    super.dispose();
  }

  Future<String?> _saveImage(String? tempPath) async {
    if (tempPath == null) return null;
    final directory = await getApplicationDocumentsDirectory();
    final fileName = '${const Uuid().v4()}.jpg';
    final newPath = '${directory.path}/$fileName';
    await File(tempPath).copy(newPath);
    log('Saved image to: $newPath');
    return newPath;
  }

  Future<void> _selectTime() async {
    final TimeOfDay? selected = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Localizations.override(
          context: context,
          locale: const Locale('ar'),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child!,
          ),
        );
      },
    );
    if (selected != null) {
      final formattedTime = DateFormat.jm(
        'ar',
      ).format(DateTime(2025, 1, 1, selected.hour, selected.minute));
      setState(() {
        timeController.text = formattedTime;
      });
      log('Selected time: $formattedTime');
    }
  }

  bool _isValidTime(String time) {
    if (time.isEmpty) return false;
    try {
      DateFormat.jm('ar').parse(time);
      return true;
    } catch (e) {
      log('Time validation failed: $time, error: $e');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomBodyScreen(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  S.of(context).addMedicinePrompt,
                  style: TextStyle(fontSize: 14),
                ),
              ),
              CameraSection(
                medicineNameController: medicineNameController,
                onImagePicked: (path) => setState(() => imagePath = path),
              ),
              const SizedBox(height: 16),
              MedicineTimeSection(
                selectedTime: selectedTime,
                onChanged: (val) => setState(() => selectedTime = val),
                items: [
                  S.of(context).beforeMeal,
                  S.of(context).afterMeal,
                  S.of(context).duringMeal,
                ],
              ),
              const SizedBox(height: 16),
              RepeatDaysSection(
                daysSelected: daysSelected,
                onChanged: (index, value) {
                  setState(() {
                    daysSelected[index] = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              TimeAndQuantitySection(
                frequencyController: frequencyController,
                timeController: timeController,
                dosage: dosage,
                onDosageChanged: (val) => setState(() => dosage = val),
                onTimeTap: _selectTime,
              ),

              const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomButton(
                  title: 'اضافة الدواء',
                  onPressed: () async {
                    if (medicineNameController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('يرجى إدخال اسم الدواء')),
                      );
                      return;
                    }
                    if (timeController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('يرجى إدخال وقت التذكير')),
                      );
                      return;
                    }
                    if (!_isValidTime(timeController.text)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('صيغة الوقت غير صحيحة')),
                      );
                      return;
                    }
                    if (daysSelected.every((selected) => !selected)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('يرجى اختيار يوم واحد على الأقل'),
                        ),
                      );
                      return;
                    }

                    final savedImagePath = await _saveImage(imagePath);
                    final newReminder = DrugReminder(
                      id: const Uuid().v4(),
                      drugName: medicineNameController.text,
                      frequency: frequencyController.text,
                      dosage: dosage ?? S.of(context).spoon,
                      time: timeController.text,
                      mealTiming: selectedTime ?? 'قبل تناول الطعام',
                      stopDate: stopDate ?? 'دواء دائم',
                      daysSelected: daysSelected,
                      imagePath: savedImagePath,
                    );

                    if (widget.onAddReminder != null) {
                      widget.onAddReminder!(newReminder);
                    }
                    Navigator.of(context).pop(newReminder);
                  },
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
