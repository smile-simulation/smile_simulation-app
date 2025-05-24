import 'package:flutter/material.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/custome_drop_down_container.dart';
import 'package:smile_simulation/generated/l10n.dart';

class TimeAndQuantitySection extends StatefulWidget {
  const TimeAndQuantitySection({super.key});

  @override
  State<TimeAndQuantitySection> createState() => _TimeAndQuantitySectionState();
}

class _TimeAndQuantitySectionState extends State<TimeAndQuantitySection> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    // تأخير التهيئة باستخدام addPostFrameCallback بعد بناء الـ context
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        selectedValue = S.of(context).spoon;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> items = [
      S.of(context).spoon,
      S.of(context).pill,
      S.of(context).halfPill,
    ];

    return Row(
      children: [
        // Time section
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).time,
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
                        labelText: S.of(context).time,
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

        // Quantity section
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).quantity,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 12),
                CustomDropdownContainer(
                  hint: S.of(context).quantity,
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

        // Delete icon
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 40, 0, 0),
          child: Image.asset('assets/images/delete.png', width: 40, height: 40),
        ),
      ],
    );
  }
}
