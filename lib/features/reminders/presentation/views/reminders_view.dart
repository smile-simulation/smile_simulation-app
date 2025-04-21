import 'package:flutter/material.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/reminders_view_body.dart';

class RemindersView extends StatelessWidget {
  const RemindersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold (body: RemindersViewBody(),);
  }
}