import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/features/reminders/presentation/views/visiting_dates_view.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/custom_card.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/darily_activities_view.dart';
import 'package:smile_simulation/features/reminders/presentation/views/drug_reminder_view.dart';
import 'package:smile_simulation/features/reminders/presentation/views/other_tasks_view.dart';
import 'package:smile_simulation/generated/l10n.dart';

import '../../../../core/helper_functions/custom_error.dart';

class RemindersView extends StatelessWidget {
  const RemindersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, title: S.of(context).reminders),
      body: RemindersViewBody(),
    );
  }
}

class RemindersViewBody extends StatelessWidget {
  const RemindersViewBody({super.key});

  void _navigateToView(BuildContext context, String title) {
    final s = S.of(context);
    Widget destinationView;
    switch (title) {
      case String sTitle when sTitle == s.medicineReminder:
        destinationView = DrugReminderView();
        break;
      case String sTitle when sTitle == s.visitSchedules:
        destinationView = VisitingDatesView();
        break;
      case String sTitle when sTitle == s.dailyActivities:
        destinationView = DailyActivitiesView();
        break;
      case String sTitle when sTitle == s.otherTasks:
        destinationView = OtherTasksView();
        break;
      default:
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('No view defined for $title')));
        return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => destinationView),
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context); // نحصل على الترجمة هنا
    final List<Map<String, String>> items = [
      {
        "title": s.medicineReminder,
        "image": "assets/images/reminder_drug_stimulant.png",
      },
      {
        "title": s.visitSchedules,
        "image": "assets/images/reminder_visitings_dates.png",
      },
      {
        "title": s.dailyActivities,
        "image": "assets/images/reminder_daily_activities.png",
      },
      {
        "title": s.otherTasks,
        "image": "assets/images/reminder_other_tasks.png",
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: CustomBodyScreen(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 3 / 2.5,
                children:
                    items.map((item) {
                      return InkWell(onTap: () =>

                          comingSoon(context),

                        // _navigateToView(context, item["title"]!),
                        child: CustomcardScreen(
                          title: item["title"]!,
                          imagePath: item["image"]!,
                        ),
                      );
                    }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
