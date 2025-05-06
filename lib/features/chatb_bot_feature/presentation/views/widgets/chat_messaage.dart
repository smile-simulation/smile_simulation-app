import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/features/chatb_bot_feature/presentation/views/widgets/bot_message.dart';
import 'package:smile_simulation/features/chatb_bot_feature/presentation/views/widgets/user_message.dart';

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUserMessage;

  ChatMessage({required this.text, required this.isUserMessage});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUserMessage ? Alignment.centerLeft : Alignment.centerRight,
      child:
          isUserMessage ? UserMessage(text: text) : ChatBotMessage(text: text),
    );
  }
}
