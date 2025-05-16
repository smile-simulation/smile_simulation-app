import 'package:flutter/material.dart';
import 'package:smile_simulation/core/helper_functions/my_launch_url.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_cached_network_image.dart';
import 'package:smile_simulation/generated/l10n.dart';
import '../../../../data/models/advice/advice.dart';

class AdviceViewBodyContent extends StatelessWidget {
  const AdviceViewBodyContent({super.key, required this.advice});

  final Advice advice;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                CustomCachedNetworkImage(
                  image: advice.image,
                  width: double.infinity,
                  height: 198,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 16),
                Text(
                  advice.title ?? S.of(context).adviceTitleError,
                  style: AppTextStyles.headline2(context),
                ),
                SizedBox(height: 16),
                Text(
                  advice.description ?? S.of(context).adviceContentError,
                  style: AppTextStyles.style16W400(context),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
