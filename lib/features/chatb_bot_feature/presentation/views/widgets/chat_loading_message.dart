import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/widgets/custom_loading_shimmer.dart';

class ChatLoadingMessage extends StatelessWidget {
  const ChatLoadingMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Align(
        alignment: Alignment.centerRight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.veryLightGreyColor,
              radius: 15,
              child: CircleAvatar(
                radius: 12,
                backgroundColor: AppColors.veryLightGreyColor,
                backgroundImage: AssetImage(
                  'assets/images/logo_of_chat_bot.png',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 2, 8),
              child: Container(
                width: 60,
                height: 32,
                decoration: BoxDecoration(
                  color: AppColors.meduimLightGrey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(24),
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: LoadingIndicator(indicatorType: Indicator.ballPulse),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
