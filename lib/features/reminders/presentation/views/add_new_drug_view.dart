import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/camera_section.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/date_of_stopping_taking_medicin.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/medicine_time_section.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/repeat_day_section.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/time_and_quantity_section.dart';
import 'package:smile_simulation/generated/l10n.dart';

class AddNewDrugView extends StatelessWidget {
  const AddNewDrugView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        context,
        title: S.of(context).addMedicine,
        isBack: true,
      ),
      body: AddNewDrugViewBody(),
    );
  }
}

class AddNewDrugViewBody extends StatefulWidget {
  @override
  _AddNewDrugScreenBodyState createState() => _AddNewDrugScreenBodyState();
}

class _AddNewDrugScreenBodyState extends State<AddNewDrugViewBody> {
  String? selectedTime;
  List<bool> daysSelected = List.generate(7, (_) => false);
  final TextEditingController medicineNameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomBodyScreen(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                S.of(context).addMedicineInstruction,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            const CameraSection(),
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
            const TimeAndQuantitySection(),
            const SizedBox(height: 16),
            const DateOfStoppingTakkingMedicin(),
            const SizedBox(height: 32),
            CustomButton(
              title: S.of(context).addMedicineButton,
              onPressed: () {
                // تنفيذ العملية المطلوبة عند الضغط
              },
            ),
          ],
        ),
      ),
    );
  }
}
