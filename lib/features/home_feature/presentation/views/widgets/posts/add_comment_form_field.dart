import 'package:flutter/material.dart';

class AddCommentFormField extends StatelessWidget {
  const AddCommentFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Add a comment...',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
