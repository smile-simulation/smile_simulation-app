import 'dart:io';
import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/features/reminders/data/models/drug_reminder.dart';
import 'package:smile_simulation/features/reminders/presentation/views/add_new_drug_view.dart';
import 'package:smile_simulation/features/reminders/presentation/views/edit_drug_reminder_view.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/custom_container_for_reminders_features.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/custome_reminder_button.dart';


class DrugReminderViewBodyIfNotFirstTime extends StatelessWidget {
  final List<DrugReminder> reminders;
  final void Function(DrugReminder) onUpdateReminder;
  final void Function(String) onDeleteReminder;
  final VoidCallback onClearAllReminders;

  const DrugReminderViewBodyIfNotFirstTime({
    super.key,
    required this.reminders,
    required this.onUpdateReminder,
    required this.onDeleteReminder,
    required this.onClearAllReminders,
  });

  Future<bool?> _showDeleteConfirmationDialog(BuildContext context, String drugName) {
    return showDialog<bool>(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: const Text('تأكيد الحذف'),
          content: Text('هل أنت متأكد من حذف تذكير الدواء "${drugName.isEmpty ? 'غير مسمى' : drugName}"؟'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('إلغاء'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('حذف', style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool?> _showClearAllConfirmationDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child:




        AlertDialog(
          title: const Text('تأكيد حذف جميع التذكيرات'),
          content: const Text('هل أنت متأكد من حذف جميع تذكيرات الأدوية؟ سيتم حذف جميع الصور المرتبطة أيضًا.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('إلغاء'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('حذف الكل', style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomBodyScreen(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'منبهات الأدوية',
                    style: AppTextStyles.headline2(context),
                  ),
                  CustomButton(
                    title: 'حذف الكل',
                    isGreyBackground: true,
                    isExtraMinWidth: true,
                    onPressed: () async {
                      final confirm = await _showClearAllConfirmationDialog(context);
                      // final confirm = await customWarning(
                      //   context,
                      //   massage: '',
                      //
                      //
                      // );


                      if (confirm == true) {
                        onClearAllReminders();
                      }
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: reminders.length,
                itemBuilder: (context, index) {
                  final reminder = reminders[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                    child: GestureDetector(
                      onTap: () async {
                        final result = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => EditDrugReminderView(reminder: reminder),
                          ),
                        );
                        if (result != null) {
                          if (result is DrugReminder) {
                            onUpdateReminder(result);
                          } else if (result is Map && result.containsKey('delete')) {
                            onDeleteReminder(result['delete']);
                          }
                        }
                      },
                      child: CustomContainerForReminderFeature(
                        widget: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  child: reminder.imagePath != null &&
                                          File(reminder.imagePath!).existsSync()
                                      ? Image.file(
                                          File(reminder.imagePath!),
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.cover,
                                        )
                                      : Container(
                                          width: 85,
                                          height: 85,
                                          color: Colors.grey.shade200,
                                          child: const Icon(Icons.image, color: Colors.grey),
                                        ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        reminder.drugName.isEmpty ? 'دواء غير مسمى' : reminder.drugName,
                                        style: AppTextStyles.subTitle1(context)
                                            .copyWith(color: AppColors.primaryColor),
                                      ),
                                      const SizedBox(height: 18),
                                      Text(
                                        '${reminder.frequency.isEmpty ? 'غير محدد' : reminder.frequency} (${reminder.dosage})',
                                        style: AppTextStyles.subTitle2(context),
                                      ),
                                      const SizedBox(height: 14),
                                      Row(
                                        children: [
                                          Text(
                                            reminder.mealTiming.isEmpty ? 'غير محدد' : reminder.mealTiming,
                                            style: AppTextStyles.subTitle2(context),
                                          ),
                                          const SizedBox(width: 15),
                                          Text(
                                            reminder.time.isEmpty ? 'غير محدد' : reminder.time,
                                            style: AppTextStyles.subTitle2(context),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red, size: 24),
                              onPressed: () async {
                                final confirm = await _showDeleteConfirmationDialog(context, reminder.drugName);
                                if (confirm == true) {
                                  onDeleteReminder(reminder.id);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            CustomeReminderButton(
              text: 'إضافة تذكير جديد',
              onPressed: () async {
                final result = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AddNewDrugView(),
                  ),
                );
                if (result != null && result is DrugReminder) {
                  onUpdateReminder(result);
                }
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
