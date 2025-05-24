// import 'package:flutter/material.dart';
// import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
// import 'package:smile_simulation/core/widgets/custom_button.dart';

// import '../add_new_drug_view.dart';
// import 'camera_section.dart';
// import 'date_of_stopping_taking_medicin.dart';
// import 'medicine_time_section.dart';
// import 'repeat_day_section.dart';
// import 'time_and_quantity_section.dart';

// class AddNewDrugViewBody extends StatefulWidget {
//   @override
//   _AddNewDrugScreenBodyState createState() => _AddNewDrugScreenBodyState();
// }

// class _AddNewDrugScreenBodyState extends State<AddNewDrugViewBody> {
//   String? selectedTime;
//   List<bool> daysSelected = List.generate(7, (_) => false);
//   final TextEditingController medicineNameController = TextEditingController();
//   final TextEditingController quantityController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Expanded(
//           child: CustomBodyScreen(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 15),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 16,
//                     vertical: 8,
//                   ),
//                   child: Text(
//                     "اضف الادوية التي تستخدمها الي تنبيهانك الطبية حتي نتمكن من تذكيرك بها اوقاتها المحددة",
//                     style: TextStyle(fontSize: 14),
//                   ),
//                 ),
//                 CameraSection(),
//                 MedicineTimeSection(
//                   selectedTime: selectedTime,
//                   onChanged: (val) => setState(() => selectedTime = val),
//                   items: const [
//                     "قبل تناول الطعام",
//                     "بعد تناول الطعام",
//                     "أثناء تناول الطعام",
//                   ],
//                 ),
//                 SizedBox(height: 16),
//                 RepeatDaysSection(
//                   daysSelected: daysSelected,
//                   onChanged: (index, value) {
//                     setState(() {
//                       daysSelected[index] = value;
//                     });
//                   },
//                 ),
//                 SizedBox(height: 16),
//                 TimeAndQuantitySection(),
//                 SizedBox(height: 16),
//                 DateOfStoppingTakkingMedicin(),

//                 Spacer(),
//                 CustomButton(
//                   title: 'اضافة الدواء',
//                   onPressed: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => AddNewDrugView(),
//                       ),
//                     );
//                   },
//                 ),
//                 SizedBox(height: 16),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
