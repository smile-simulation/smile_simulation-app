import 'package:flutter/material.dart';
import 'package:smile_simulation/features/reminders/presentation/views/widgets/custome_drop_down_container.dart';

class TimeAndQuantitySection extends StatelessWidget {
  const TimeAndQuantitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text(
              "الوقت",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 12),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'الوقت',
                  border: OutlineInputBorder(),
                  suffixIcon:Image.asset( 'assets/images/clock.png',width: 20,height: 20,),
                ),
                keyboardType: TextInputType.datetime,
                
              ),
            
            ],
          ),
        ),
      ),
      const SizedBox(width: 16),
      Expanded(
        child: Padding(
          
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                "الكمية",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
              ),
              CustomDropdownContainer(value: value, items: ['1,2,3'], onChanged: ,
              const SizedBox(height: 12),
             // CustomDropdownContainer(value: value, items: items, onChanged: onChanged)
            ],
          ),
        ),
      ),
    ],);
  }
}