import 'package:flutter/material.dart';

import 'chat_bot.dart';

class ChatbotView extends StatelessWidget {
  const ChatbotView({super.key});
  static const String routeName = 'ChatbotHome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat bot'),
        backgroundColor: (Colors.deepPurple),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: TextButton(
          child: Text('Ask chatbot'),
          onPressed: () {
           },
        ),
      ),
    );
  }
}
