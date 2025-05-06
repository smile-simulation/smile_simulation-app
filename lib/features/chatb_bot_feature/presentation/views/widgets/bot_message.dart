import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

class ChatBotMessage extends StatelessWidget {
  const ChatBotMessage({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
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

            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 2, 8),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.meduimLightGrey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(24),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Text(
                    text,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    maxLines: null, // 👈 allows unlimited lines
                    softWrap: true, // 👈 makes sure text wraps to the next line
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 8),
              Icon(
                Icons.thumb_up_alt_outlined,
                color: AppColors.grayHeavyText_1Color,
                size: 18,
              ),
              SizedBox(width: 8),
              Icon(
                Icons.thumb_down_alt_outlined,
                color: AppColors.grayHeavyText_1Color,
                size: 18,
              ),
              SizedBox(width: 8),
              Icon(Icons.copy, color: AppColors.grayHeavyText_1Color, size: 18),
              SizedBox(width: 8),
              Icon(
                Icons.share_outlined,
                color: AppColors.grayHeavyText_1Color,
                size: 18,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
