import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

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
              child: Image.asset(
                onBoardingData[currentIndex].image,
                fit: BoxFit.fill,
                width: 310,
                height: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
