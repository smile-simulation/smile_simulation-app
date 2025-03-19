import 'package:smile_simulation/generated/assets.dart';

import 'model/on_boarding_model.dart';

class OnBoardingData {
  static List<OnBoardingModel> onBoardingData = [
    OnBoardingModel(
      image: Assets.imagesOnBoarding1,
    shape:  Assets.imagesOnBoardingShap2,
      description:
          "منتدى شامل يساعدك على اكتشاف نصائح طبية وإجابات احترافية في مكان واحد. \nاحصل على الدعم والمشورة من خبراء الأسنان وزملائك المرضى بسهولة.",
    ),
    OnBoardingModel(
      image: Assets.imagesOnBoarding2,
      shape:  Assets.imagesOnBoardingShap1,
      description:
          "كل معلوماتك الطبية في مكان واحد، من التشخيص إلى العلاج، راقب حالتك الطبية خطوة بخطوة.",
    ),
    OnBoardingModel(
      image: Assets.imagesOnBoarding3,
      shape:  Assets.imagesOnBoardingShap2,
      description: "كل ما تحتاجه من نصائح عملية لضمان صحة فم وأسنان مثالية.",
    ),
    OnBoardingModel(
      image: Assets.imagesOnBoarding4,
      shape:  Assets.imagesOnBoardingShap3,
      description: "إدارة وقتك أصبحت أسهل اجعل صحة أسنانك أولوية.",
    ),
    OnBoardingModel(
      image: Assets.imagesOnBoarding5,
      shape:  Assets.imagesOnBoardingShap4,
      description: "دردشة سريعة وآمنة لحل جميع أسئلتك المتعلقة بصحة الفم.",
    ),
  ];
}
