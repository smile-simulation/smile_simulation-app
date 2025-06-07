import 'package:flutter/material.dart';
import 'package:smile_simulation/core/services/local_notification_service.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/generated/l10n.dart';
import 'package:timezone/timezone.dart' as tz;

import 'posts_list_view.dart';

class HomeViewBodyContent extends StatelessWidget {
  const HomeViewBodyContent({super.key});

  tz.TZDateTime convertToTZDateTime(DateTime dateTime) {
    return tz.TZDateTime.from(dateTime, tz.local);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(45),
          topRight: Radius.circular(45),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                S.of(context).posts,
                style: AppTextStyles.headline2(
                  context,
                ).copyWith(color: AppColors.blackColor),
              ),

              Spacer(),
              TextButton(
                onPressed: () async {
                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (pickedTime != null) {
                    final now = DateTime.now();
                    final dateTime = DateTime(
                      now.year,
                      now.month,
                      now.day,
                      pickedTime.hour,
                      pickedTime.minute,
                    );

                    LocalNotificationService.scheduleReminderNotification(
                      title: "هذا اشعار مجدول",
                      body: 'هذا الاشعار مجدول لوقت معين ',
                      payload: '',
                      id: 5,
                      scheduledDate: convertToTZDateTime(dateTime),
                    );
                  }
                },
                child: Text("data"),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Expanded(child: PostsListView(currentUser: false)),
        ],
      ),
    );
  }
}
