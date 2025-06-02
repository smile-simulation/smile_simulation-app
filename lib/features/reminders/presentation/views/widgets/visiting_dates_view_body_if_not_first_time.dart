import 'dart:io';
import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/features/reminders/data/models/visist_reminder.dart';

import 'package:smile_simulation/features/reminders/presentation/views/widgets/add_new_visiting_date_body.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/custom_container_for_reminders_features.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/custome_reminder_button.dart';
import 'package:smile_simulation/generated/l10n.dart';

class VisitingDatesViewBodyIfNotFirstTime extends StatefulWidget {
  final List<VisitReminder> visits;
  final void Function(VisitReminder) onUpdateReminder;
  final void Function(String) onDeleteReminder;
  final VoidCallback onClearAllReminders;

  const VisitingDatesViewBodyIfNotFirstTime({
    super.key,
    required this.visits,
    required this.onUpdateReminder,
    required this.onDeleteReminder,
    required this.onClearAllReminders, required List<VisitReminder> reminders,
  });

  @override
  State<VisitingDatesViewBodyIfNotFirstTime> createState() =>
      _VisitingDatesViewBodyIfNotFirstTimeState();
}

class _VisitingDatesViewBodyIfNotFirstTimeState
    extends State<VisitingDatesViewBodyIfNotFirstTime> {
  bool isEditMode = false;

  Future<bool?> _showDeleteConfirmationDialog(
    BuildContext context,
    String name,
  ) {
    return showDialog<bool>(
      context: context,
      builder:
          (context) => Directionality(
            textDirection: TextDirection.rtl,
            child: AlertDialog(
              title: const Text('تأكيد الحذف'),
              content: Text(
                'هل أنت متأكد من حذف تذكير الزيارة "${name.isEmpty ? 'غير مسمى' : name}"؟',
              ),
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
    bool isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return CustomBodyScreen(
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).visitSchedules,
                  style: AppTextStyles.headline2(context),
                ),
                CustomButton(
                  title: isEditMode ? S.of(context).cancel : S.of(context).edit,
                  isGreyBackground: !isEditMode,
                 // isExtraEnabled: true,
                  onPressed: () {
                    setState(() {
                      isEditMode = !isEditMode;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.visits.length,
              itemBuilder: (context, index) {
                final reminder = widget.visits[index];
                return Stack(
                  children: [
                    if (isEditMode)
                      Positioned(
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: GestureDetector(
                            onTap: () async {
                              final confirm =
                                  await _showDeleteConfirmationDialog(
                                    context,
                                    reminder.name,
                                  );
                              if (confirm == true) {
                                widget.onDeleteReminder(reminder.id);
                              }
                            },
                            child: CustomContainerForReminderFeature(
                              color: AppColors.redColor,
                              widget: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/delete.png",
                                      color: Colors.white,
                                      width: 28,
                                      height: 28,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    Container(
                      margin:
                          isArabic
                              ? EdgeInsets.only(right: isEditMode ? 70 : 0)
                              : EdgeInsets.only(left: isEditMode ? 70 : 0),
                      child: GestureDetector(
                        onTap: () async {
                          final result = await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder:
                                  (context) => AddNewVisitingDateBody(
                                    reminder: reminder,
                                  ),
                            ),
                          );
                          if (result != null) {
                            if (result is VisitReminder) {
                              widget.onUpdateReminder(result);
                            } else if (result is Map &&
                                result.containsKey('delete')) {
                              widget.onDeleteReminder(result['delete']);
                            }
                          }
                        },
                        child: CustomContainerForReminderFeature(
                          widget: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 32,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    if (reminder.imagePath != null &&
                                        File(reminder.imagePath!).existsSync())
                                      Image.file(
                                        File(reminder.imagePath!),
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                      )
                                    else
                                      Container(
                                        width: 50,
                                        height: 50,
                                        color: Colors.grey.shade200,
                                        child: const Icon(
                                          Icons.image,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Text(
                                        reminder.name.isEmpty
                                            ? 'زيارة غير مسماة'
                                            : reminder.name,
                                        style: AppTextStyles.subTitle1(
                                          context,
                                        ).copyWith(
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 18),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      reminder.date.isEmpty
                                          ? 'غير محدد'
                                          : reminder.date,
                                      style: AppTextStyles.subTitle2(context),
                                    ),
                                    Text(
                                      reminder.time.isEmpty
                                          ? 'غير محدد'
                                          : reminder.time,
                                      style: AppTextStyles.subTitle2(context),
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
              },
            ),
            const SizedBox(height: 40),
            CustomeReminderButton(
              text: S.of(context).addNewReminder,
              onPressed: () async {
                final result = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AddNewVisitingDateBody(),
                  ),
                );
                if (result != null && result is VisitReminder) {
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
