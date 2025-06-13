import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/features/chat_bot/presentaion/views/chat_bot.dart';
import '../../../../../generated/assets.dart';
import 'chat_bot_text_field.dart';
import 'chat_loading_message.dart';
import 'chat_messaage.dart';

class ChatBotViewBody extends StatefulWidget {
  @override
  _ChatBotViewBodyState createState() => _ChatBotViewBodyState();
}

class _ChatBotViewBodyState extends State<ChatBotViewBody> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];
  final ChatbotService _chatbotService =
      ChatbotService(); // Initialize ChatbotService
  bool _isLoading = false;
  final ScrollController _scrollController = ScrollController();
  void _scrollToEnd() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  @override
  void initState() {
    super.initState();
    _chatbotService.initialize(); // Initialize ChatbotService
  }

  void _sendMessage() async {
    final message = _controller.text;
    if (message.isEmpty) return;

    setState(() {
      _messages.add(ChatMessage(text: message, isUserMessage: true));
      _isLoading = true; // Show loading indicator
    });

    _controller.clear();

    try {
      // Use ChatbotService to send message
      final response = await _chatbotService.ask(message);

      setState(() {
        _messages.add(ChatMessage(text: response, isUserMessage: false));
        _isLoading = false;
        
      });
    } catch (e) {
      setState(() {
        _messages.add(ChatMessage(text: 'Error: $e', isUserMessage: false));
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return CustomBodyScreen(
      child: Column(
        children: [
          Expanded(
            child:
                (_messages.isEmpty && !_isLoading)
                    ? Center(
                      child: Image.asset(
                        Assets.imagesChatAi,
                        width: 300,
                        fit: BoxFit.cover,
                      ),
                    )
                    : ListView.builder(
                      controller: _scrollController,
                      itemCount: _messages.length + (_isLoading ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (_isLoading && index == _messages.length) {
                          return ChatLoadingMessage();
                        }
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
                controller: _controller,
                onSendMessage: _sendMessage,
                scrollToEnd: _scrollToEnd,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
