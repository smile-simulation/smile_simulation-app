import 'package:firebase_ai/firebase_ai.dart';

class ChatbotService {
  late final ChatSession _chatSession;
  bool _isInitialized = false;

  Future<void> initialize() async {
    if (_isInitialized) return;

    final generationConfig = GenerationConfig(
      maxOutputTokens: 1024,
      temperature: 1,
      topP: 1,
    );

    final safetySettings = [
      SafetySetting(
        HarmCategory.hateSpeech,
        HarmBlockThreshold.high,
        HarmBlockMethod.severity,
      ),
      SafetySetting(
        HarmCategory.dangerousContent,
        HarmBlockThreshold.high,
        HarmBlockMethod.severity,
      ),
      SafetySetting(
        HarmCategory.sexuallyExplicit,
        HarmBlockThreshold.high,
        HarmBlockMethod.severity,
      ),
      SafetySetting(
        HarmCategory.harassment,
        HarmBlockThreshold.high,
        HarmBlockMethod.severity,
      ),
    ];

    final systemInstruction = Content('system', [
      TextPart('انت مساعد ذكاء اصطناعي متخصص في طب و علاج الفم و الأسنان.'),
    ]);

    final ai = await FirebaseAI.vertexAI(location: 'global');

    final model = ai.generativeModel(
      model: 'gemini-2.5-flash-preview-05-20',
      generationConfig: generationConfig,
      safetySettings: safetySettings,
      systemInstruction: systemInstruction,
    );

    _chatSession = model.startChat();
    _isInitialized = true;
  }

  Future<String> ask(String question) async {
    if (!_isInitialized) {
      throw Exception(
        "ChatbotService not initialized. Call initialize() first.",
      );
    }

    final userContent = Content('user', [TextPart(question)]);
    final response = await _chatSession.sendMessage(userContent);
    return response.text ?? "no respond";
  }
}
