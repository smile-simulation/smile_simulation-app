import 'package:flutter/material.dart';

class CustomDropdownContainer extends StatelessWidget {
  final String? value;
  final List<String> items;
  final Function(String?) onChanged;
  final double? width; // ⬅️ New parameter

  const CustomDropdownContainer({
    Key? key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.width, // ⬅️ Optional width
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width, // ⬅️ Use it here
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: DropdownButtonFormField<String>(
        value: value,
        onChanged: onChanged,
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
        ),
        icon: const Icon(Icons.arrow_drop_down),
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
        dropdownColor: Colors.white,
        isExpanded: true,
        alignment: AlignmentDirectional.centerEnd,
        items: items
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(
                    e,
                    textAlign: TextAlign.right,
                  ),
                ))
            .toList(),
      ),
    );
  }
}
