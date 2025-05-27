import 'package:flutter/material.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/custome_drop_down_container.dart';
import 'package:smile_simulation/generated/l10n.dart';

class MedicineTimeSection extends StatelessWidget {
  final String? selectedTime;
  final Function(String?) onChanged;
  final List<String> items;
  final String? title;

  const MedicineTimeSection({
    Key? key,
    required this.selectedTime,
    required this.onChanged,
    required this.items,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? S.of(context).medicineTime,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 12),
          CustomDropdownContainer(
            hint: S.of(context).beforeMeal,
            value: selectedTime,
            onChanged: onChanged,
            items:
                items
                    .map(
                      (e) => DropdownMenuItem<String>(value: e, child: Text(e)),
                    )
                    .toList(),
          ),
        ],
      ),
    );
  }
}
