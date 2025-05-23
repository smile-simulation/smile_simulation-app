import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/features/reminders/data/models/reminder.dart';
import 'package:smile_simulation/features/reminders/presentation/views/add_new_drug_view.dart';
import 'package:smile_simulation/features/reminders/presentation/views/edit_drug_reminder_view.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/custom_container_for_reminders_features.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/custome_reminder_button.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/camera_picker_image.dart';

class DrugReminderViewBodyIfNotFirstTime extends StatefulWidget {
  final List<Reminder> reminders;
  final void Function(Reminder) onUpdateReminder;
  final void Function(String) onDeleteReminder;

  const DrugReminderViewBodyIfNotFirstTime({
    super.key,
    required this.reminders,
    required this.onUpdateReminder,
    required this.onDeleteReminder,
  });

  @override
  State<DrugReminderViewBodyIfNotFirstTime> createState() =>
      _DrugReminderViewBodyIfNotFirstTimeState();
}

class _DrugReminderViewBodyIfNotFirstTimeState
    extends State<DrugReminderViewBodyIfNotFirstTime> {
  bool isSelected = false;

  Future<bool?> _showDeleteConfirmationDialog(BuildContext context, String drugName) {
    return showDialog<bool>(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: const Text('تأكيد الحذف'),
          content: Text('هل أنت متأكد من حذف تذكير الدواء "$drugName"؟'),
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

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomBodyScreen(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'منبهات الأدوية',
                    style: AppTextStyles.headline2(context),
                  ),
                  CustomButton(
                    title: isSelected ? 'تعديل' : 'الغاء',
                    isGreyBackground: !isSelected,
                    isExtraMinWidth: true,
                    onPressed: () {
                      setState(() {
                        isSelected = !isSelected;
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.reminders.length,
                itemBuilder: (context, index) {
                  final reminder = widget.reminders[index];
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      if (isSelected)
                        CustomContainerForReminderFeature(
                          color: AppColors.primaryColor,
                          widget: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: GestureDetector(
                                  onTap: () async {
                                    final confirm = await _showDeleteConfirmationDialog(
                                        context, reminder.drugName);
                                    if (confirm == true) {
                                      widget.onDeleteReminder(reminder.id);
                                    }
                                  },
                                  child: Image.asset(
                                    "assets/images/delete.png",
                                    color: Colors.white,
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      Padding(
                        padding: EdgeInsets.only(right: isSelected ? 0 : 70),
                        child: GestureDetector(
                          onTap: () async {
                            final result = await Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => EditDrugReminderView(reminder: reminder),
                              ),
                            );
                            if (result != null) {
                              if (result is Reminder) {
                                widget.onUpdateReminder(result);
                              } else if (result is Map && result.containsKey('delete')) {
                                widget.onDeleteReminder(result['delete']);
                              }
                            }
                          },
                          child: CustomContainerForReminderFeature(
                            widget: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  child: CameraPickerWidget(width: 85, height: 85),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        reminder.drugName,
                                        style: AppTextStyles.subTitle1(context)
                                            .copyWith(color: AppColors.primaryColor),
                                      ),
                                      const SizedBox(height: 18),
                                      Text(
                                        '${reminder.frequency} (${reminder.dosage})',
                                        style: AppTextStyles.subTitle2(context),
                                      ),
                                      const SizedBox(height: 14),
                                      Row(
                                        children: [
                                          Text(
                                            reminder.mealTiming,
                                            style: AppTextStyles.subTitle2(context),
                                          ),
                                          const SizedBox(width: 15),
                                          Text(
                                            reminder.time,
                                            style: AppTextStyles.subTitle2(context),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
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
                if (result != null && result is Reminder) {
                  widget.onUpdateReminder(result);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}