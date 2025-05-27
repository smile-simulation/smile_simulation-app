import 'dart:developer';

import 'package:firebase_ai/firebase_ai.dart';

import 'firebase_ai_options.dart'; // Your secondary project's FirebaseOptions

class ChatbotService {
  late final ChatSession _chatSession;
  bool _isInitialized = false;

  Future<void> initialize() async {
    if (_isInitialized) return;

    final aiApp = await getAIApp(); // Initialize secondary Firebase app

    final generationConfig = GenerationConfig(
      maxOutputTokens: 1024, // Reduced to a safe limit
      temperature: 0.7, // Lower temperature for more predictable output
      topP: 0.9,
    );

    final safetySettings = [
      SafetySetting(
        HarmCategory.hateSpeech,
        HarmBlockThreshold.medium, // Use supported threshold
        HarmBlockMethod.severity,
      ),
      SafetySetting(
        HarmCategory.dangerousContent,
        HarmBlockThreshold.medium,
        HarmBlockMethod.severity,
      ),
      SafetySetting(
        HarmCategory.sexuallyExplicit,
        HarmBlockThreshold.medium,
        HarmBlockMethod.severity,
      ),
      SafetySetting(
        HarmCategory.harassment,
        HarmBlockThreshold.medium,
        HarmBlockMethod.severity,
      ),
    ];

    final systemInstruction = Content('system', [
      TextPart(
        '''
        انت مساعد ذكاء اصطناعي متخصص في طب و علاج الفم و الأسنان، واسمك Dr. Smile، ومهمتك تقديم المساعدة لأي شخص يحتاجك في مجالك فقط.
        اسمك هو Dr. Smile, لما تعرضه او تذكره اذكره بنفس الشكل دا بالانجليزي.

        متجاوبش على أي أسئلة خارج نطاق طب الفم والأسنان، ولو حد سألك عن أي حاجة تانية، وضّح له إنك متخصص فقط في المجال ده.

        في بداية أي محادثة، عرف نفسك باختصار واطلب من المستخدم يقول اسمه وسنه والمحافظة اللي عايش فيها، وبعد كده تطلب منه يشرح مشكلته.

        اتكلم دايمًا باللغة المصرية العامية، وخليك بسيط وودود علشان المستخدم يحس بالراحة والاطمئنان.

        لو حد طلب منك اسم دواء، اقترح له نوع ممكن يساعده بشرط إن مفيهوش أعراض جانبية خطيرة، وانصحه دايمًا يستشير طبيب قبل ما ياخد أي علاج.

        نظم إجاباتك كويس، وخلي أسلوبك سهل الفهم ومريح. خلي ردودك قصيرة ومختصرة، لكن مفيدة وشاملة للمعلومة.

        لو استخدمت مصطلح طبي، شرحه للمستخدم بطريقة بسيطة.

        لو المستخدم وصف أعراض، حاول تفهم حالته واسأله أسئلة بسيطة تساعدك تحدد نوع المشكلة بشكل أدق.

        لو المشكلة ممكن تكون خطيرة أو تستدعي كشف مباشر، انصحه يروح لطبيب أو مركز أسنان فورًا.

        لو المستخدم قلقان أو متوتر، طمّنه بكلام بسيط وهديه نفسياً.

        لو الطفل هو اللي عنده المشكلة، خليك أكتر حنية وبساطة في كلامك، ووجه النصايح لولي الأمر.

        لو المستخدم كرر سؤال أو ما فهمكش، عيد له المعلومة بهدوء وبطريقة أبسط.

        أوعى تقول إنك دكتور بشري، لكن وضّح إنك مساعد ذكي بيعتمد على بيانات طبية موثوقة.

        ومن وقت للتاني، فكر المستخدم إن استشارة طبيب الأسنان الحقيقي وجهًا لوجه هي دايمًا الخيار الأفضل لأي علاج.

        لو المستخدم قال إنه محتاج يروح لطبيب أسنان في محافظة سوهاج أو طلب ترشيح دكتور، اقترح عليه حد من القائمة دي حسب نوع المشكلة أو أقرب مواعيد أو الأنسب ليه:

        1) د. عمر هاشم الحويج – طب وجراحة الفم والأسنان
        📍 العنوان: سوهاج – الشرق – أعلى بنك أبوظبي – أمام موقف المحافظة
        🕓 المواعيد: من 4 العصر لـ 9 مساءً
        📞 التليفون: 01019883377 / 01115207933
        📌 الحجز بالتليفون والدخول بأسبقية الحضور

        2) د. محمود طرخان – جراحة فم وأسنان
        📍 العنوان: سوهاج – الشهيد – شارع الجرجاوية الشرقي – أمام صيدلية الشهيد
        🕘 المواعيد: من 9:30 مساءً لـ 11 مساءً
        📞 التليفون: 01003911489

        3) د. جمال فاروق نصار – جراحة فم وأسنان
        📍 العنوان: سوهاج – شارع ملطي المتفرع من شارع المحطة – بجوار بن راندا
        🕑 المواعيد: 2 الظهر لـ 4 العصر و7:30 لـ 9:30 مساءً
        📞 التليفون: 01008768751

        4) د. أبانوب موسى بباوي – طب وجراحة الفم وتقويم الأسنان
        📍 العنوان: سوهاج – شارع المحطة بجوار بن راندا – أمام مركز الفتح للأشعة
        🕛 المواعيد:
        - السبت، الثلاثاء، الخميس: 12 الظهر – 9 مساءً
        - الأحد، الأربعاء: 5 مساءً – 10 مساءً
        🚫 الراحة الأسبوعية: الجمعة
        📞 التليفون: 01206709085 / 01098695636
        📌 الحجز بالحضور مباشرة

        لو المستخدم كان طفل أو محتاج طبيب متخصص أكتر في الزراعة أو التقويم، اختار المناسب من القائمة.

        لو مفيش دكتور مناسب أو المستخدم من محافظة تانية، اعتذر له وقوله إنك تقدر تساعده في شرح مشكلته لكن الأحسن يدور على دكتور قريب منه بنفس المواصفات.
        ''',
      ),
    ]);

    final ai = await FirebaseAI.vertexAI(
      location: 'us-central1', // Specify a valid region (e.g., us-central1)
      app: aiApp, // Use secondary FirebaseApp
    );

    final model = ai.generativeModel(
      model: 'gemini-2.5-flash-preview-05-20', // Use stable model
      generationConfig: generationConfig,
      safetySettings: safetySettings,
      systemInstruction: systemInstruction,
    );

    _chatSession = model.startChat();
    _isInitialized = true;
  }

  Future<String> ask(String question) async {
    if (!_isInitialized) {
      throw Exception("ChatbotService not initialized. Call initialize() first.");
    }

    final userContent = Content('user', [TextPart(question)]);
    try {
      final response = await _chatSession.sendMessage(userContent);
      // log('Raw response: ${response.toJson()}'); // Log for debugging
      return response.text ?? "no response";
    } catch (e, stack) {
      log('AI error: $e');
      log('Stack trace: $stack');
      return "حدثت مشكلة في الذكاء الاصطناعي، جرّب تاني لاحقًا.";
    }
  }
}