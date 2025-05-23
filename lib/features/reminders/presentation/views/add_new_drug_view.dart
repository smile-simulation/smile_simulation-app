import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/features/reminders/data/models/reminder.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/camera_section.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/date_of_stopping_taking_medicin.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/medicine_time_section.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/repeat_day_section.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/time_and_quantity_section.dart';
import 'package:uuid/uuid.dart';

class AddNewDrugView extends StatelessWidget {
  const AddNewDrugView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: customAppbar(context, title: 'اضافة دواء جديد', isBack: true),
        body: const AddNewDrugViewBody(),
      ),
    );
  }
}

class AddNewDrugViewBody extends StatefulWidget {
  const AddNewDrugViewBody({super.key});

  @override
  _AddNewDrugViewBodyState createState() => _AddNewDrugViewBodyState();
}

class _AddNewDrugViewBodyState extends State<AddNewDrugViewBody> {
  String? selectedTime;
  List<bool> daysSelected = List.generate(7, (_) => false);
  String? dosage;
  String? stopDate;
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CustomBodyScreen(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    "اضف الادوية التي تستخدمها الي تنبيهانك الطبية حتي نتمكن من تذكيرك بها اوقاتها المحددة",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                CameraSection(),
                MedicineTimeSection(
                  selectedTime: selectedTime,
                  onChanged: (val) => setState(() => selectedTime = val),
                  items: const [
                    "قبل تناول الطعام",
                    "بعد تناول الطعام",
                    "أثناء تناول الطعام",
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
                ),
                const SizedBox(height: 16),
                DateOfStoppingTakingMedicin(
                  stopDate: stopDate,
                  onStopDateChanged: (val) => setState(() => stopDate = val),
                ),
                const Spacer(),
                CustomButton(
                  title: 'اضافة الدواء',
                  onPressed: () {
                    final newReminder = Reminder(
                      id: const Uuid().v4(),
                      drugName: medicineNameController.text,
                      frequency: frequencyController.text,
                      dosage: dosage ?? 'معلقة',
                      time: timeController.text,
                      mealTiming: selectedTime ?? 'قبل تناول الطعام',
                      stopDate: stopDate ?? 'دواء دائم',
                      daysSelected: daysSelected,
                    );
                    Navigator.of(context).pop(newReminder);
                  },
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }
}