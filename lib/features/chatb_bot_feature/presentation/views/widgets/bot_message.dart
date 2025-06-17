import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
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
                padding: const EdgeInsets.fromLTRB(8, 8, 2, 0),
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
              IconButton(
                onPressed: () {
                  Clipboard.setData(
                    ClipboardData(
                      text: "$text \n\n تم النسخ من تطبيق Smile Simulation 🩵",
                    ),
                  );
                },
                icon: Icon(
                  Icons.copy,
                  // color: AppColors.grayHeavyText_1Color,
                  color: AppColors.primaryColor,
                  size: 18,
                ),
              ),

              IconButton(
                onPressed: () {
                  String message =
                      '$text \n\n تم المشاركه من تطبيق Smile Simulation 🩵';
                  Share.share(message, subject: 'Try Smile Simulation App');
                },
                icon: Icon(
                  Icons.share_outlined,
                  color: AppColors.primaryColor,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
