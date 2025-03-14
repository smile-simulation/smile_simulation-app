import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static TextStyle heading1(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 24),
      fontWeight: FontWeight.w700,
      fontFamily: 'Cairo',
    );
  }

  static TextStyle heading2(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 21),
      fontWeight: FontWeight.w700,
      fontFamily: 'Cairo',
    );
  }

  static TextStyle heading3(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 18),
      fontWeight: FontWeight.w700,
      fontFamily: 'Cairo',
    );
  }

  static TextStyle subTitle1(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 16),
      fontWeight: FontWeight.w700,
      fontFamily: 'Cairo',
    );
  }

  static TextStyle style16W400(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 16),
      fontWeight: FontWeight.w400,
      fontFamily: 'Cairo',
    );
  }

  static TextStyle subTitle2(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 14),
      fontWeight: FontWeight.w700,
      fontFamily: 'Cairo',
    );
  }

  static TextStyle bodyText1(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 14),
      fontWeight: FontWeight.w400,
      fontFamily: 'Cairo',
    );
  }

  static TextStyle button(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 14),
      fontWeight: FontWeight.w700,
      fontFamily: 'Cairo',
      letterSpacing: 0.25,
    );
  }

  static TextStyle bodyText2(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 12),
      fontWeight: FontWeight.w400,
      fontFamily: 'Cairo',
    );
  }

  static TextStyle textButton(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 12),
      fontWeight: FontWeight.w700,
      fontFamily: 'Cairo',
    );
  }

  static TextStyle caption1(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 11),
      fontWeight: FontWeight.w400,
      fontFamily: 'Cairo',
    );
  }

  static TextStyle caption2(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 10),
      fontWeight: FontWeight.w400,
      fontFamily: 'Cairo',
    );
  }

  static double getResponsiveScaleFactor(
    BuildContext context, {
    required double fontSize,
  }) {
    double scaleFactor = getScaleFactor(context);
    double responsiveFontSize = fontSize * scaleFactor;

    return responsiveFontSize.clamp(fontSize * 0.9, fontSize * 1.1);
  }

  static double getScaleFactor(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (width <= 600) {
      return 1; // شاشات صغيرة (موبايل)
    } else if (width <= 1200) {
      return 1.2; // شاشات متوسطة (تابلت)
    } else {
      return 1.4; // شاشات كبيرة (ديسكتوب)
    }
  }
}



// import 'package:flutter/material.dart';
// import 'package:smile_simulation/core/utils/app_colors.dart';

// abstract class AppTextStyles {
//   static TextStyle style46Bold(BuildContext context) {
//     return TextStyle(
//       fontSize: getResponsiveScaleFactor(context, fontSize: 46),
//       fontWeight: FontWeight.bold,
//       fontFamily: 'Cairo',
//     );
//   }

//   static TextStyle baseStyle(
//     BuildContext context,
//     double fontSize,
//     FontWeight fontWeight, {
//     Color? color,
//   }) {
//     return TextStyle(
//       fontSize: getResponsiveScaleFactor(context, fontSize: fontSize),
//       fontWeight: fontWeight,
//       fontFamily: 'Cairo',
//       color: color,
//     );
//   }

//   static TextStyle style20W700(BuildContext context) {
//     return baseStyle(context, 20, FontWeight.w700, color: AppColors.whiteColor);
//   }

//   static TextStyle style12W700(BuildContext context) {
//     return baseStyle(context, 12, FontWeight.w700);
//   }

//   static TextStyle style14W700(BuildContext context) {
//     return baseStyle(context, 14, FontWeight.w700);
//   }

//   static TextStyle style16W700(BuildContext context) {
//     return baseStyle(context, 16, FontWeight.w700);
//   }
  
//   static TextStyle style18W700(BuildContext context) {
//     return baseStyle(context, 18, FontWeight.w700);
//   }

//   static TextStyle style14W400(BuildContext context) {
//     return baseStyle(context, 14, FontWeight.w400);
//   }

//   static TextStyle style16W400(BuildContext context) {
//     return baseStyle(context, 16, FontWeight.w400);
//   }

//   static TextStyle style10W400(BuildContext context) {
//     return baseStyle(context, 10, FontWeight.w400, color: AppColors.greyColor);
//   }
// }

// double getResponsiveScaleFactor(
//   BuildContext context, {
//   required double fontSize,
// }) {
//   double scaleFactor = getScaleFactor(context);
//   double responsiveFontSize = fontSize * scaleFactor;

//   return responsiveFontSize.clamp(fontSize * 0.9, fontSize * 1.1);
// }

// double getScaleFactor(BuildContext context) {
//   double width = MediaQuery.of(context).size.width;

//   if (width <= 600) {
//     return 1; // شاشات صغيرة (موبايل)
//   } else if (width <= 1200) {
//     return 1.2; // شاشات متوسطة (تابلت)
//   } else {
//     return 1.4; // شاشات كبيرة (ديسكتوب)
//   }
// }
