
import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/features/chat_bot/presentaion/views/chat_bot_view.dart';
import 'package:smile_simulation/generated/l10n.dart';

import 'posts_list_view.dart';

class HomeViewBodyContent extends StatelessWidget {
  const HomeViewBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(45),
          topRight: Radius.circular(45),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                S.of(context).posts,
                style: AppTextStyles.headline2(
                  context,
                ).copyWith(color: AppColors.blackColor),
              ),
              TextButton(
                onPressed: () async {
                  // String txt = await ChatbotService().ask("What is your name");
                  // log(txt);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MyChatbotView();
                      },
                    ),
                  );
                },
                child: Text("Ask Chat"),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Expanded(
            child: PostsListView(currentUser: false),
          ), // ❌ بدون scrollController
        ],
      ),
    );
  }
}
