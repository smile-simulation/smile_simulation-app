import 'package:flutter/material.dart';

import 'package:hugging_face_chat_gradio/hugging_face_chat_gradio.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/features/chatb_bot_feature/presentation/views/widgets/chat_bot_text_field.dart';
import 'package:smile_simulation/features/chatb_bot_feature/presentation/views/widgets/chat_messaage.dart';
// Import the new file

class ChatBotViewBody extends StatefulWidget {
  @override
  _ChatBotViewBodyState createState() => _ChatBotViewBodyState();
}

class _ChatBotViewBodyState extends State<ChatBotViewBody> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];

  // ✅ كيان الكلاينت الخاص بـ HuggingFace
  final client = HuggingFaceChatGradioClient(
    baseUrl: 'https://baher-hamada-final-project.hf.space',
    predictEndpoint: '/gradio_api/call/predict',
  );

  bool _isLoading = false; // ✅ عشان نعرض "البوت بيفكر"

  void _sendMessage() async {
    final message = _controller.text;
    if (message.isEmpty) return;

    setState(() {
      // ✅ أضيف رسالة المستخدم
      _messages.add(ChatMessage(text: message, isUserMessage: true));
      _isLoading = true; // ✅ أبدأ التحميل (البوت بيفكر)
    });

    _controller.clear();

    try {
      // ✅ استدعاء الـ API الخاص بـ Hugging Face
      final response = await client.sendMessage(message);

      setState(() {
        // ✅ أضيف رد البوت
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
  Widget build(BuildContext context) {
    return CustomBodyScreen(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length + (_isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (_isLoading && index == _messages.length) {
                  // ✅ أثناء التحميل (البوت بيرد)
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ChatMessage(text: '...', isUserMessage: false),
                  );
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
