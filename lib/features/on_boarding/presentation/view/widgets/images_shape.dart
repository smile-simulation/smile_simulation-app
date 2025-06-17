import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

import '../../../data/model/on_boarding_model.dart';

class ImagesShape extends StatelessWidget {
  final bool isOut;
  final int currentIndex;
  final List<OnBoardingModel> onBoardingData;

  const ImagesShape({
    super.key,
    required this.isOut,
    required this.currentIndex,
    required this.onBoardingData,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      width: double.infinity,
      child: Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              top: isOut ? -700 : 64,
              right: 16,
              left: 16,
              child: FadeInDown(
                child: Image.asset(onBoardingData[currentIndex].shape),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              top: 120,

              right: isOut ? 700 : 32,
              left: isOut ? -700 : 32,
              child: Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(12),
                 border: Border.all(
                   color: currentIndex ==0 ||currentIndex ==5 ||currentIndex ==4 ||currentIndex ==2? AppColors.transparent : AppColors.primaryColor
                 )
               ),

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    onBoardingData[currentIndex].image,
                    fit: BoxFit.fill,
                    width: 310,
                    height: 200,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
