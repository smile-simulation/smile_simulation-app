import 'dart:async';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/features/on_boarding/presentation/view/widgets/images_shape.dart';
import 'package:smile_simulation/features/on_boarding/presentation/view/widgets/title_and_description.dart';

import '../../data/on_boarding_data.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  static const routeName = 'onBoardingScreen';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  bool isOut = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            currentIndex != 0
                ? GestureDetector(
                  onTap: () {
                    setState(() {
                      isOut = !isOut;
                    });
                    Timer(const Duration(milliseconds: 300), () {
                      currentIndex = currentIndex - 1;
                      setState(() {
                        isOut = !isOut;
                      });
                    });
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.whiteColor,
                  ),
                )
                : null,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'simulation ',
              style: AppTextStyles.headline1(context).copyWith(
                color: AppColors.lightGreyColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              'Smile',
              style: AppTextStyles.headline1(
                context,
              ).copyWith(color: AppColors.whiteColor),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45),
            topRight: Radius.circular(45),
          ),
        ),
        child: Column(
          children: [
            ImagesShape(
              isOut: isOut,
              currentIndex: currentIndex,
              onBoardingData: OnBoardingData.onBoardingData,
            ),
            Expanded(
              child: TitleAndDescription(
                currentIndex: currentIndex,
                isOut: isOut,
                onBoardingData: OnBoardingData.onBoardingData,
              ),
            ),
            SizedBox(height: 30),
            DotsIndicator(
              dotsCount: 5,
              animate: true,
              position: currentIndex.toDouble(),
              decorator: DotsDecorator(
                size: Size(10.0, 10.0),

                activeSize: Size(16.0, 10.0),
                color: AppColors.lightGreyColor,
                activeColor: AppColors.primaryColor,
                spacing: EdgeInsets.symmetric(horizontal: 4.0),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: currentIndex != 4,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isOut = !isOut;
                        });
                        Timer(const Duration(milliseconds: 300), () {
                          currentIndex = 4;
                          setState(() {
                            isOut = !isOut;
                          });
                        });
                      },
                      child: Text(
                        "تخطي",
                        style: AppTextStyles.button1(
                          context,
                        ).copyWith(color: AppColors.greyLightColor),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isOut = !isOut;
                      });
                      Timer(const Duration(milliseconds: 300), () {
                        currentIndex == 4
                            ? {
                              // saveOnBoardingState(),
                              // context.pushReplacementNamed(Routes.homeScreen),
                            }
                            : currentIndex = currentIndex + 1;

                        setState(() {
                          isOut = !isOut;
                        });
                      });
                    },
                    child:
                        currentIndex == 4
                            ? Container(
                              width: 130,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: AppColors.primaryColor,
                              ),

                              child: Center(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "أبدء",
                                      style: AppTextStyles.button1(
                                        context,
                                      ).copyWith(color: AppColors.whiteColor),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: AppColors.whiteColor,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            )
                            : SizedBox(
                              height: 45,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "التالي",
                                    style: AppTextStyles.button1(
                                      context,
                                    ).copyWith(color: AppColors.primaryColor),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: AppColors.primaryColor,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
