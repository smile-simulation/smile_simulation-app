import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_app_bar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/camera_section.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/medicine_time_section.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/repeat_day_section.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/time_and_quantity_section.dart';
import 'package:url_launcher/url_launcher.dart';

class AddNewDrugScreenBody extends StatefulWidget {
  @override
  _AddNewDrugScreenBodyState createState() => _AddNewDrugScreenBodyState();
}

class _AddNewDrugScreenBodyState extends State<AddNewDrugScreenBody> {
  String? selectedTime;
  String? stopDate;
  List<bool> daysSelected = List.generate(7, (_) => false);
  final TextEditingController medicineNameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CustomBodyScreen(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
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
                    ], // لو عايز تغير العنوان
                  ),

                  SizedBox(height: 16),

                  // التكرار
                  RepeatDaysSection(
                    daysSelected: daysSelected,
                    onChanged: (index, value) {
                      setState(() {
                        daysSelected[index] = value;
                      });
                    },
                  ),

                  SizedBox(height: 16),

                  // الكمية والوقت
                  TimeAndQuantitySection(),
                  SizedBox(height: 16),

                  // تاريخ التوقف
                  Text("تاريخ التوقف عن الدواء"),
                  DropdownButtonFormField<String>(
                    value: stopDate,
                    onChanged: (val) => setState(() => stopDate = val),
                    items:
                        ["دواء دائم", "تاريخ معين"]
                            .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)),
                            )
                            .toList(),
                  ),
                  SizedBox(height: 24),

                  // زر إضافة الدواء
                  CustomButton(title: 'اضافة الدواء', onPressed: () {}),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
