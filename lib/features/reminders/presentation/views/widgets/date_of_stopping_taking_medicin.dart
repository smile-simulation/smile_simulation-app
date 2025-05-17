import 'package:flutter/material.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/custome_drop_down_container.dart';

class DateOfStoppingTakkingMedicin extends StatefulWidget {
  const DateOfStoppingTakkingMedicin({super.key});

  @override
  State<DateOfStoppingTakkingMedicin> createState() =>
      _DateOfStoppingTakkingMedicinState();
}

class _DateOfStoppingTakkingMedicinState
    extends State<DateOfStoppingTakkingMedicin> {
  String? stopDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "تاريخ التوقف عن الدواء",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 12),
          CustomDropdownContainer(
            hint: "دواء دائم",
            value: stopDate,
            items:
                ["دواء دائم", "تاريخ معين"]
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
            onChanged: (val) => setState(() => stopDate = val),
          ),
        ],
      ),
    );
  }
}
