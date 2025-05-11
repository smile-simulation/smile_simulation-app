import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_app_bar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';

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
        CustomAppBar(title: 'اضافة دواء جديد', icon: Icons.arrow_back),
        Expanded(
          child: CustomBodyScreen(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Text(
                    "اضف الادوية التي تستخدمها الي تنبيهانك الطبية حتي نتمكن من تذكيرك بها اوقاتها المحددة",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),

                  // اسم الدواء
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.camera),
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("اسم الدواء"),
                            TextField(
                              controller: medicineNameController,
                              decoration: InputDecoration(
                                hintText: "اسم الدواء",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  // وقت تناول الدواء
                  Text("وقت تناول الدواء"),
                  DropdownButtonFormField<String>(
                    value: selectedTime,
                    onChanged: (val) => setState(() => selectedTime = val),
                    items:
                        [
                              "قبل تناول الطعام",
                              "بعد تناول الطعام",
                              "أثناء تناول الطعام",
                            ]
                            .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)),
                            )
                            .toList(),
                  ),
                  SizedBox(height: 16),

                  // التكرار
                  Text("التكرار"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(7, (index) {
                      final days = [
                        "أحد",
                        "إثنين",
                        "ثلاثاء",
                        "أربعاء",
                        "خميس",
                        "جمعة",
                        "سبت",
                      ];
                      return Column(
                        children: [
                          Checkbox(
                            value: daysSelected[index],
                            onChanged:
                                (val) =>
                                    setState(() => daysSelected[index] = val!),
                          ),
                          Text(days[index]),
                        ],
                      );
                    }),
                  ),
                  SizedBox(height: 16),

                  // الكمية والوقت
                  Text("الكمية"),
                  TextField(
                    controller: quantityController,
                    decoration: InputDecoration(hintText: "الكمية"),
                  ),
                  SizedBox(height: 8),
                  Text("الوقت"),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.add),
                    label: Text("إضافة جرعة أخرى"),
                  ),
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
