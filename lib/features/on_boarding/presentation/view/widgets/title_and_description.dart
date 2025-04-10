import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';

import '../../../data/model/on_boarding_model.dart';

class TitleAndDescription extends StatelessWidget {
  const TitleAndDescription({
    super.key,
    required this.isOut,
    required this.onBoardingData,
    required this.currentIndex,
  });

  final bool isOut;
  final int currentIndex;
  final List<OnBoardingModel> onBoardingData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 300),
        scale: isOut ? 0 : 1,
        child: Text(
          onBoardingData[currentIndex].description,
          style: AppTextStyles.headline2(context),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
