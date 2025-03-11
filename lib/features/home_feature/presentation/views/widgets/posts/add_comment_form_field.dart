import 'package:flutter/material.dart';

class AddCommentFormField extends StatelessWidget {
  const AddCommentFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        
        hintText: 'التعليق...',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
