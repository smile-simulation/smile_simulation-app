import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/features/chatb_bot_feature/presentation/views/widgets/chat_messaage.dart';
import 'package:smile_simulation/features/chatb_bot_feature/presentation/views/widgets/chat_bot_text_field.dart'; // Import the new file

class ChatBotViewBody extends StatefulWidget {
  @override
  _ChatBotViewBodyState createState() => _ChatBotViewBodyState();
}

class _ChatBotViewBodyState extends State<ChatBotViewBody> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];

  void _sendMessage() {
    if (_controller.text.isEmpty) return;
    setState(() {
      _messages.add(ChatMessage(text: _controller.text, isUserMessage: true));
      _messages.add(
        ChatMessage(text: "${_controller.text}", isUserMessage: false),
      );
      _controller.clear();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBodyScreen(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: _messages[index],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.lightGreyColor,
                    blurRadius: 10,
                    spreadRadius: 3,
                    offset: Offset(5, 5),
                  ),
                ],
                border: Border.all(color: Colors.transparent),
              ),
              child: ChatBotTextField(
                controller: _controller, // Pass the controller here
                onSendMessage: _sendMessage, // Pass the _sendMessage method
              ),
            ),
          ),
        ],
      ),
    );
  }
}
