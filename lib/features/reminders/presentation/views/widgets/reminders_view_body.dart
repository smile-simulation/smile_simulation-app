import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/features/reminders/presentation/views/visiting_dates_view.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/custom_card.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/darily_activities_view.dart';
import 'package:smile_simulation/features/reminders/presentation/views/drug_reminder_view.dart';
import 'package:smile_simulation/features/reminders/presentation/views/other_tasks_view.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/visit_reminders_view.dart';

import 'package:smile_simulation/generated/l10n.dart';

// Import your destination views (adjust package name if needed)

class RemindersViewBody extends StatelessWidget {
  RemindersViewBody({super.key});

  // List of image paths and titles
  final List<Map<String, String>> items = [
    {
      "title": "منبه الدواء",
      "image": "assets/images/reminder_drug_stimulant.png",
    },
    {
      "title": "مواعيد الزيارات",
      "image": "assets/images/reminder_visitings_dates.png",
    },
    {
      "title": "الأنشطة اليومية",
      "image": "assets/images/reminder_daily_activities.png",
    },
    {"title": "مهام أخرى", "image": "assets/images/reminder_other_tasks.png"},
  ];

  // Function to navigate based on card title
  void _navigateToView(BuildContext context, String title) {
    Widget destinationView;
    switch (title) {
      case "منبه الدواء":
        destinationView = DrugReminderView();
        break;
      case "مواعيد الزيارات":
        destinationView = VisitingDatesView();
        break;
      case "الأنشطة اليومية":
        destinationView = DailyActivitiesView();
        break;
      case "مهام أخرى":
        destinationView = OtherTasksView();
        break;
      default:
        // Fallback or error handling
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: CustomBodyScreen(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              child: GridView.count(
                crossAxisCount: 2, // 2 columns
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 3 / 2.5, // Width / Height ratio
                children:
                    items.map((item) {
                      return InkWell(
                        onTap: () => _navigateToView(context, item["title"]!),
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
