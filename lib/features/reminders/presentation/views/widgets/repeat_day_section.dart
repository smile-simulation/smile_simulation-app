import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

class RepeatDaysSection extends StatelessWidget {
  final List<bool> daysSelected;
  final Function(int index, bool value) onChanged;

  const RepeatDaysSection({
    Key? key,
    required this.daysSelected,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final days = ["أحد", "إثنين", "ثلاثاء", "أربعاء", "خميس", "جمعة", "سبت"];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "التكرار",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.right,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(7, (index) {
            return Column(
              children: [
                Checkbox(
                  value: daysSelected[index],
                  onChanged: (val) => onChanged(index, val!),
                  activeColor:
                      AppColors
                          .primaryColor, // Color of checkbox fill when checked
                  checkColor: Colors.white, // Color of checkmark
                ),
                Text(days[index]),
              ],
            );
          }),
        ),
      ],
    );
  }
}
