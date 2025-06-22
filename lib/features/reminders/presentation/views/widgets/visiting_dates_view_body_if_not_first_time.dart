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
  final List<VisitReminder> reminders;
  final void Function(VisitReminder) onUpdateReminder;
  final void Function(String) onDeleteReminder;
  final VoidCallback onClearAllReminders;

  const VisitingDatesViewBodyIfNotFirstTime({
    super.key,
    required this.reminders,
    required this.onUpdateReminder,
    required this.onDeleteReminder,
    required this.onClearAllReminders,
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
          (context) => AlertDialog(
            title: const Text('تأكيد الحذف'),
            content: Text(
              'هل أنت متأكد من حذف تذكير الزيارة "${name.isEmpty ? 'غير مسمى' : name}"؟',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(S.of(context).cancel),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text('حذف', style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
    );
  }

  Future<bool?> _showDeleteAllConfirmationDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('تأكيد حذف جميع التذكيرات'),
            content: const Text(
              'هل أنت متأكد من حذف جميع تذكيرات الزيارات؟ لا يمكن التراجع عن هذا الإجراء.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(S.of(context).cancel),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text(
                  'حذف الكل',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
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
                  title: "حذف الكل",
                  isGreyBackground: true,
                  isExtraMinWidth: true,
                  onPressed: () async {
                    final confirm = await _showDeleteAllConfirmationDialog(
                      context,
                    );
                    if (confirm == true) {
                      widget.onClearAllReminders();
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            ListView.builder(
              key: ValueKey(widget.reminders.length),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.reminders.length,
              itemBuilder: (context, index) {
                final reminder = widget.reminders[index];
                return Stack(
                  children: [
                    if (isEditMode)
                      Positioned(
                        left: isArabic ? null : 0,
                        right: isArabic ? 0 : null,
                        top: 0,
                        bottom: 0,
                        child: GestureDetector(
                          onTap: () async {
                            final confirm = await _showDeleteConfirmationDialog(
                              context,
                              reminder.name,
                            );
                            if (confirm == true) {
                              widget.onDeleteReminder(reminder.id);
                            }
                          },
                          child: CustomContainerForReminderFeature(
                            color: AppColors.redColor,
                            widget: const Padding(
                              padding: EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  ImageIcon(
                                    AssetImage("assets/images/delete.png"),
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                    LayoutBuilder(
                      builder: (context, constraints) {
                        double screenWidth = constraints.maxWidth;
                        double imageSize =
                            screenWidth * 0.12; // 12% of screen width
                        double sideMargin = isEditMode ? screenWidth * 0.18 : 0;

                        return Container(
                          margin:
                              isArabic
                                  ? EdgeInsets.only(right: sideMargin)
                                  : EdgeInsets.only(left: sideMargin),
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
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.04,
                                  vertical: screenWidth * 0.06,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        if (reminder.imagePath != null &&
                                            File(
                                              reminder.imagePath!,
                                            ).existsSync())
                                          Image.file(
                                            File(reminder.imagePath!),
                                            width: imageSize,
                                            height: imageSize,
                                            fit: BoxFit.cover,
                                          )
                                        else
                                    SizedBox(),
                                        SizedBox(width: screenWidth * 0.04),
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Text(
                                                reminder.name.isEmpty
                                                    ? 'زيارة غير مسماة'
                                                    : reminder.name,
                                                style: AppTextStyles.subTitle1(
                                                  context,
                                                ).copyWith(
                                                  color: AppColors.primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Spacer(),
                                              IconButton(
                                                onPressed: () async {
                                                  final confirm =
                                                      await _showDeleteConfirmationDialog(
                                                        context,
                                                        reminder.date.isEmpty
                                                            ? 'غير محدد'
                                                            : reminder.date,
                                                      );
                                                  if (confirm == true) {
                                                    widget.onDeleteReminder(
                                                      reminder.id,
                                                    ); // 💥 Actual delete
                                                  }
                                                },

                                                icon: const Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                  size: 24,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: screenWidth * 0.05),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            reminder.date.isEmpty
                                                ? 'غير محدد'
                                                : reminder.date,
                                            style: AppTextStyles.subTitle2(
                                              context,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                            reminder.time.isEmpty
                                                ? 'غير محدد'
                                                : reminder.time,
                                            style: AppTextStyles.subTitle2(
                                              context,
                                            ),
                                            textAlign: TextAlign.end,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
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
