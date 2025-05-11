import 'dart:async';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:smile_simulation/constant.dart';
import 'package:smile_simulation/core/database/cache/cache_helper.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:smile_simulation/features/auth/login/presentation/view/login_view.dart';
import 'package:smile_simulation/features/on_boarding/data/model/on_boarding_model.dart';
import 'package:smile_simulation/features/on_boarding/presentation/view/widgets/images_shape.dart';
import 'package:smile_simulation/features/on_boarding/presentation/view/widgets/title_and_description.dart';
import 'package:smile_simulation/generated/l10n.dart';

import '../../../../core/widgets/bottom_navigation_bar/bottom_nvaigation_view.dart';
import '../../data/on_boarding_data.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  static const routeName = 'onBoardingScreen';

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int currentIndex = 0;
  bool isOut = false;

  @override
  Widget build(BuildContext context) {
    List<OnBoardingModel> data = OnBoardingData.getOnBoardingData(context);
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
            Visibility(
              visible: isArabic == 'en',
              child: Text(
                'Smile',
                style: AppTextStyles.headline1(
                  context,
                ).copyWith(color: AppColors.whiteColor),
              ),
            ),
            Text(
              ' simulation ',
              style: AppTextStyles.headline1(context).copyWith(
                color: AppColors.lightGreyColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            Visibility(
              visible: isArabic == 'ar',
              child: Text(
                'Smile',
                style: AppTextStyles.headline1(
                  context,
                ).copyWith(color: AppColors.whiteColor),
              ),
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
              onBoardingData: data,
            ),
            Expanded(
              child: TitleAndDescription(
                currentIndex: currentIndex,
                isOut: isOut,
                onBoardingData: data,
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
                        S.of(context).skip,
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
                      Timer( Duration(milliseconds: currentIndex == 4?0: 300), () {
                        currentIndex == 4
                            ? {
                              Navigator.pushReplacementNamed(
                                context, LoginView.routeName,
                              ),   CacheHelper.sharedPreferences.setBool(
                            isOnboardingViewSeen,
                            true,
                          ),
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
                                      S.of(context).start,
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
                                    S.of(context).next,
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
