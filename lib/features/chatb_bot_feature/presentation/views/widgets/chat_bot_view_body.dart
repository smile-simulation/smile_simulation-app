import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';

class ChatBotViewBody extends StatefulWidget {
  @override
  _ChatBotViewBodyState createState() => _ChatBotViewBodyState();
}

class _ChatBotViewBodyState extends State<ChatBotViewBody> {
  TextEditingController _controller = TextEditingController();
  List<ChatMessage> _messages = [];

  void _sendMessage() {
    if (_controller.text.isEmpty) return;
    setState(() {
      _messages.add(ChatMessage(text: _controller.text, isUserMessage: true));
      _messages.add(
        ChatMessage(
          text: "Bot response to: ${_controller.text}",
          isUserMessage: false,
        ),
      );
      _controller.clear();
    });
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
                return _messages[index];
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // Background color
                borderRadius: BorderRadius.circular(30), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: AppColors.lightGreyColor, // Shadow color
                    blurRadius: 10, // Softness of the shadow
                    spreadRadius: 3, // Shadow spread
                    offset: Offset(5, 5), // Shadow position
                  ),
                ],
                border: Border.all(color: Colors.transparent), // Transparent border
              ),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: AppColors.primaryColor,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.lightGreyColor),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: "تحدث مع الشات",
                  hintStyle: TextStyle(color: AppColors.greyColor),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.send, color: AppColors.primaryColor),
                    onPressed: _sendMessage,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUserMessage;

  ChatMessage({required this.text, required this.isUserMessage});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: isUserMessage ? AppColors.primaryColor : AppColors.veryLightGreyColor,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (!isUserMessage) // If it's the bot's message
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CircleAvatar(
                    backgroundImage:null
                    ), // Replace with your logo URL or asset path
                    // radius: 15,
                  ),
                ),
              Text(
                text,
                style: TextStyle(
                  color: isUserMessage ? Colors.white : Colors.black,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
