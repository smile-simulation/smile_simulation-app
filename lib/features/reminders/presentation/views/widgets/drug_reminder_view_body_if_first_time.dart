import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/features/reminders/data/models/drug_reminder.dart';
import 'package:smile_simulation/features/reminders/presentation/views/add_new_drug_view.dart';
import 'custome_reminder_button.dart';
import 'text_setion_in_reminder_feature.dart';

class DrugReminderViewBodyIfFirstTime extends StatelessWidget {
  final void Function(DrugReminder reminder) onAddReminder;

  const DrugReminderViewBodyIfFirstTime({
    super.key,
    required this.onAddReminder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CustomBodyScreen(
            child: Column(
              children: [
                const SizedBox(height: 90),
                Container(
                  width: 250,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/reminder_drug_stimulant.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const TextSetionInReminderFeature(
                  text1: 'أضف الأدوية التي تتناولها ... وسوف نذكرك بمواعيدها',
                  text2:
                      'أضف الأدوية التي تستخدمها إلى تنبيهاتك الطبية حتى نتمكن',
                  text3: 'من تذكيرك بها في أوقاتها المحددة',
                ),
                const SizedBox(height: 50),
                CustomeReminderButton(
                  text: 'اضافة اول تذكير',
                  onPressed: () async {
                    final result = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AddNewDrugView(),
                      ),
                    );
                    if (result != null && result is DrugReminder) {
                      onAddReminder(result);
                    }
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