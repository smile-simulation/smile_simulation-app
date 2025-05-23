import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/core/widgets/custom_text_field.dart';
import 'package:smile_simulation/features/reminders/data/models/reminder.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/custom_container_for_reminders_features.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/custome_drop_down_container.dart';
import 'package:uuid/uuid.dart';

class EditDrugReminderView extends StatelessWidget {
  final Reminder? reminder;

  const EditDrugReminderView({super.key, this.reminder});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: customAppbar(context, title: 'منبه الدواء', isBack: true),
        body: EditDrugReminderViewBody(reminder: reminder),
      ),
    );
  }
}

class EditDrugReminderViewBody extends StatefulWidget {
  final Reminder? reminder;

  const EditDrugReminderViewBody({super.key, this.reminder});

  @override
  State<EditDrugReminderViewBody> createState() => _EditDrugReminderViewBodyState();
}

class _EditDrugReminderViewBodyState extends State<EditDrugReminderViewBody> {
  late TextEditingController drugNameController;
  late TextEditingController frequencyController;
  late TextEditingController timeController;
  late TextEditingController mealTimingController;
  late String? dosage;
  late String? stopDate;
  late List<bool> daysSelected;
  final List<String> dosageItems = ['معلقة', 'حباية', 'نص حباية'];
  final List<String> stopDateItems = ['دواء دائم', 'تاريخ معين'];

  @override
  void initState() {
    super.initState();
    drugNameController = TextEditingController(text: widget.reminder?.drugName ?? '');
    frequencyController = TextEditingController(text: widget.reminder?.frequency ?? '');
    timeController = TextEditingController(text: widget.reminder?.time ?? '');
    mealTimingController = TextEditingController(text: widget.reminder?.mealTiming ?? '');
    dosage = widget.reminder?.dosage ?? 'معلقة';
    stopDate = widget.reminder?.stopDate ?? 'دواء دائم';
    daysSelected = widget.reminder?.daysSelected ?? List.generate(7, (_) => false);
  }

  @override
  void dispose() {
    drugNameController.dispose();
    frequencyController.dispose();
    timeController.dispose();
    mealTimingController.dispose();
    super.dispose();
  }

  Future<bool?> _showDeleteConfirmationDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: const Text('تأكيد الحذف'),
          content: Text('هل أنت متأكد من حذف تذكير الدواء "${drugNameController.text}"؟'),
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
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Expanded(
          child: CustomBodyScreen(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomContainerForReminderFeature(
                      widget: Image.asset(
                        'assets/images/edit_drug_reminder.png',
                        height: screenHeight * 0.2,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      'اسم الدواء',
                      style: AppTextStyles.subTitle2(context),
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      hintText: 'اسم الدواء',
                      keyboardType: TextInputType.text,
                      controller: drugNameController,
                      fillColor: Colors.white,
                    ),
                    const SizedBox(height: 18),
                    Text('التكرار', style: AppTextStyles.subTitle2(context)),
                    const SizedBox(height: 8),
                    CustomTextField(
                      hintText: '3 مرات يوميا',
                      keyboardType: TextInputType.text,
                      controller: frequencyController,
                      fillColor: Colors.white,
                    ),
                    const SizedBox(height: 18),
                    Text('الكمية', style: AppTextStyles.subTitle2(context)),
                    const SizedBox(height: 8),
                    CustomDropdownContainer(
                      hint: 'الكمية',
                      value: dosage,
                      items: dosageItems
                          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (val) => setState(() => dosage = val),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      'وقت التنبيه',
                      style: AppTextStyles.subTitle2(context),
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      hintText: '8:30 صباحًا',
                      keyboardType: TextInputType.datetime,
                      controller: timeController,
                      fillColor: Colors.white,
                    ),
                    const SizedBox(height: 18),
                    Text(
                      'وقت تناول الدواء:',
                      style: AppTextStyles.subTitle2(context),
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      hintText: 'قبل تناول الطعام',
                      keyboardType: TextInputType.text,
                      controller: mealTimingController,
                      fillColor: Colors.white,
                    ),
                    const SizedBox(height: 18),
                    Text(
                      'تاريخ التوقف عن الدواء',
                      style: AppTextStyles.subTitle2(context),
                    ),
                    const SizedBox(height: 8),
                    CustomDropdownContainer(
                      hint: 'دواء دائم',
                      value: stopDate,
                      items: stopDateItems
                          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (val) => setState(() => stopDate = val),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        CustomButton(
                          title: 'تعديل البيانات',
                          isMinWidth: true,
                          onPressed: () {
                            final updatedReminder = Reminder(
                              id: widget.reminder?.id ?? const Uuid().v4(),
                              drugName: drugNameController.text,
                              frequency: frequencyController.text,
                              dosage: dosage ?? 'معلقة',
                              time: timeController.text,
                              mealTiming: mealTimingController.text,
                              stopDate: stopDate ?? 'دواء دائم',
                              daysSelected: daysSelected,
                            );
                            Navigator.of(context).pop(updatedReminder);
                          },
                        ),
                        const SizedBox(width: 40),
                        CustomButton(
                          title: 'حذف الدواء',
                          isMinWidth: true,
                          onPressed: () async {
                            final confirm = await _showDeleteConfirmationDialog(context);
                            if (confirm == true && widget.reminder != null) {
                              Navigator.of(context).pop({'delete': widget.reminder!.id});
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}