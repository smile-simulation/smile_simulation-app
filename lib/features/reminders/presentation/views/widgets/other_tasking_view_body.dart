import 'package:flutter/material.dart';

import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/custome_reminder_button.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/text_setion_in_reminder_feature.dart';
import 'package:smile_simulation/generated/l10n.dart';

class OtherTaskingViewBody extends StatelessWidget {
  const OtherTaskingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CustomBodyScreen(
            child: Column(
              children: [
                SizedBox(height: 90),
                Container(
                  width: 250,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/reminder_other_tasks.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                TextSetionInReminderFeature(
                  text1: S.of(context).addSpecialTasksPrompt,
                  text2: S.of(context).addSpecialTasksInstructionPart1,
                  text3: S.of(context).addSpecialTasksInstructionPart2,
                ),
                SizedBox(height: 50),
                CustomeReminderButton(
                  text: S.of(context).addFirstReminder,
                  onPressed: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(builder: (context) => AddNewDrugView()),
                    // );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
