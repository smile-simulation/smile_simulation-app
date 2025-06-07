// import 'package:flutter/material.dart';
// import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
// import 'package:smile_simulation/features/reminders/presentation/views/widgets/add_new_visiting_date_body.dart';
// import 'package:smile_simulation/features/reminders/presentation/views/widgets/custome_reminder_button.dart';
// import 'package:smile_simulation/features/reminders/presentation/views/widgets/text_setion_in_reminder_feature.dart';
// import 'package:smile_simulation/generated/l10n.dart';

// class VisitingDatesViewBody extends StatelessWidget {
//   const VisitingDatesViewBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CustomBodyScreen(
//       child: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(vertical: 24),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const SizedBox(height: 90),
//             Container(
//               width: 250,
//               height: 150,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 image: const DecorationImage(
//                   image: AssetImage(
//                     'assets/images/reminder_visitings_dates.png',
//                   ),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             TextSetionInReminderFeature(
//               text1: S.of(context).addVisitPrompt,
//               text2: S.of(context).addVisitInstructionPart1,
//               text3: S.of(context).addVisitInstructionPart2,
//             ),
//             const SizedBox(height: 50),
//             CustomeReminderButton(
//               text: S.of(context).addFirstReminder,
//               onPressed: () {
//                 Navigator.maybeOf(context)?.push(
//                   MaterialPageRoute(
//                     builder: (context) => const AddNewVisitingDateBody(),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
