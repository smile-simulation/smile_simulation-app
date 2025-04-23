import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/widgets/custom_app_bar.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/custom_card.dart';
import '../../../../../core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/generated/l10n.dart'; // Assuming this is your localization

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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomAppBar(
          title: S.of(context).advices,
          icon: null,
        
        ),
        Expanded(
          child: CustomBodyScreen(
            child: GridView.count(
              crossAxisCount: 2, // 2 columns
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 3 / 2.5, // 👈 Width / Height ratio
              children:
                  items.map((item) {
                    return CustomcardScreen(
                      title: item["title"]!,
                      imagePath: item["image"]!,
                    );
                  }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
