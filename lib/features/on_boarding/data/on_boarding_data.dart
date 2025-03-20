import 'package:flutter/widgets.dart';
import 'package:smile_simulation/generated/assets.dart';
import 'package:smile_simulation/generated/l10n.dart';

import 'model/on_boarding_model.dart';

class OnBoardingData {
  static List<OnBoardingModel> getOnBoardingData(BuildContext context) {
    return [
      OnBoardingModel(
        image: Assets.imagesOnBoarding1,
        shape: Assets.imagesOnBoardingShap2,
        description: S.of(context).onBoarding1,
      ),
      OnBoardingModel(
        image: Assets.imagesOnBoarding2,
        shape: Assets.imagesOnBoardingShap1,
        description: S.of(context).onBoarding2,
      ),
      OnBoardingModel(
        image: Assets.imagesOnBoarding3,
        shape: Assets.imagesOnBoardingShap2,
        description: S.of(context).onBoarding3,
      ),
      OnBoardingModel(
        image: Assets.imagesOnBoarding4,
        shape: Assets.imagesOnBoardingShap3,
        description: S.of(context).onBoarding4,
      ),
      OnBoardingModel(
        image: Assets.imagesOnBoarding5,
        shape: Assets.imagesOnBoardingShap4,
        description: S.of(context).onBoarding5,
      ),
    ];
  }
}
