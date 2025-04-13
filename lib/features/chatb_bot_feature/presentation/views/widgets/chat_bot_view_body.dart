import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';

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
        ChatMessage(
          text: "Bot response to: ${_controller.text}",
          isUserMessage: false,
        ),
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
                return _messages[index];
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
      alignment: isUserMessage ? Alignment.centerLeft : Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color:
                isUserMessage
                    ? AppColors.primaryColor
                    : AppColors.veryLightGreyColor,
            borderRadius:
                isUserMessage
                    ? BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    )
                    : BorderRadius.only(
                      topLeft: Radius.circular(24),
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(24),
                    ),
          ),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (!isUserMessage)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'smile_simulation-app/assets/images/logo_of_chat_bot.png',
                        ), // Your image
                        fit:
                            BoxFit
                                .cover, // Or BoxFit.fill depending on your needs
                      ),
                      borderRadius: BorderRadius.circular(
                        5,
                      ), // Optional round corners
                    ),
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
