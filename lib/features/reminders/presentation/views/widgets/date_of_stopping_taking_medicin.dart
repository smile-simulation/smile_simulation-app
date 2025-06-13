import 'package:flutter/material.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/custome_drop_down_container.dart';
import 'package:smile_simulation/generated/l10n.dart';

class DateOfStoppingTakingMedicin extends StatefulWidget {
  final String? stopDate;
  final void Function(String?) onStopDateChanged;

  const DateOfStoppingTakingMedicin({
    super.key,
    required this.stopDate,
    required this.onStopDateChanged,
  });

  @override
  State<DateOfStoppingTakingMedicin> createState() =>
      _DateOfStoppingTakingMedicinState();
}

class _DateOfStoppingTakingMedicinState
    extends State<DateOfStoppingTakingMedicin> {
  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      S.of(context).permanentMedicine,
      S.of(context).specificDate,
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).stopDate,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 12),
          CustomDropdownContainer(
            hint: "دواء دائم",
            value: widget.stopDate,
            items:
                items
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
            onChanged: widget.onStopDateChanged,
          ),
        ],
      ),
    );
  }
}
