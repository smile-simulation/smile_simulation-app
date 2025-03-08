import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

abstract class AppTextStyles {
  static TextStyle style46Bold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 46),
      fontWeight: FontWeight.bold,
      fontFamily: 'Cairo',
    );
  }

  static TextStyle baseStyle(
    BuildContext context,
    double fontSize,
    FontWeight fontWeight, {
    Color? color,
  }) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: fontSize),
      fontWeight: fontWeight,
      fontFamily: 'Cairo',
      color: color,
    );
  }

  static TextStyle style20W700(BuildContext context) {
    return baseStyle(context, 20, FontWeight.w700);
  }

  static TextStyle style12W700(BuildContext context) {
    return baseStyle(context, 12, FontWeight.w700);
  }

  static TextStyle style16W700(BuildContext context) {
    return baseStyle(context, 16, FontWeight.w700);
  }

  static TextStyle style14W400(BuildContext context) {
    return baseStyle(context, 14, FontWeight.w400);
  }

  static TextStyle style10W400(BuildContext context) {
    return baseStyle(context, 10, FontWeight.w400, color: AppColors.greyColor);
  }
}

double getResponsiveScaleFactor(
  BuildContext context, {
  required double fontSize,
}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = responsiveFontSize * 0.8;
  double upperLimit = responsiveFontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  if (width <= 1200) {
    return width / 1750;
  } else if (width <= 1400) {
    return width / 1750;
  } else {
    return width / 1750;
  }
}
