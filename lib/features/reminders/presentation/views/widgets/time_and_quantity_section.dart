import 'package:flutter/material.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/custome_drop_down_container.dart';

class TimeAndQuantitySection extends StatefulWidget {
  const TimeAndQuantitySection({super.key});

  @override
  State<TimeAndQuantitySection> createState() => _TimeAndQuantitySectionState();
}

class _TimeAndQuantitySectionState extends State<TimeAndQuantitySection> {
  String? selectedValue = 'معلقة'; // Default selected value
  List<String> items = ['معلقة', 'حباية', 'نص حباية']; // Dropdown items

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4, // 40% width
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "الوقت",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 12),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Center(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'الوقت',
                        labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
                        border: InputBorder.none,
                        suffixIcon: Image.asset(
                          'assets/images/clock.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                      keyboardType: TextInputType.datetime,
                      style: const TextStyle(height: 1.3, color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4, // 40% width
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "الكمية",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 12),
                CustomDropdownContainer(
                  hint: "الكمية",
                  value: selectedValue,
                  items:
                      items
                          .map(
                            (e) => DropdownMenuItem<String>(
                              value: e,
                              child: Text(e),
                            ),
                          )
                          .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedValue = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 40, 0, 0),
          child: Image.asset('assets/images/delete.png', width: 40, height: 40),
        ),
      ],
    );
  }
}
