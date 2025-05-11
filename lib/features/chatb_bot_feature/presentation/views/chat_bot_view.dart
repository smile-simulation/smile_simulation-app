import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/features/chatb_bot_feature/presentation/views/widgets/chat_bot_view_body.dart';
import 'package:smile_simulation/generated/l10n.dart';

class ChatBotView extends StatelessWidget {
  const ChatBotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: Text(
          '${S.of(context).smileChat}، ',
          overflow: TextOverflow.ellipsis,

          style: AppTextStyles.headline2(context),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.whiteColor,
      ),
      body: ChatBotViewBody(),
    );
  }
}
