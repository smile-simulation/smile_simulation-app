import 'package:flutter/material.dart';
import 'chat_bot.dart';

class MyChatbotView extends StatefulWidget {
  const MyChatbotView({super.key});
  static const String routeName = 'ChatbotHome';

  @override
  State<MyChatbotView> createState() => _MyChatbotViewState();
}

class _MyChatbotViewState extends State<MyChatbotView> {
  final ChatbotService _chatbotService = ChatbotService();

  @override
  void initState() {
    super.initState();
    _chatbotService.initialize(); // تهيئة مرة واحدة فقط
  }

  Future<void> _askChatbot(String question) async {
    final response = await _chatbotService.ask(question);
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('رد المساعد'),
            content: Text(response),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('تم'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat bot'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('اسأل المساعد'),
          onPressed: () async {
            await _askChatbot('ما هو خراج الأسنان؟');
          },
        ),
      ),
    );
  }
}
