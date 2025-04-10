import 'package:flutter/cupertino.dart';

import 'package:pinput/pinput.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';

class PinInputStyles {
  static final PinTheme defaultPinTheme = PinTheme(
    width: 45,
    height: 60,
    textStyle: TextStyle(
      fontSize: 32,
      color: AppColors.primaryColor,
      fontWeight: FontWeight.w500,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.greyColor),
      borderRadius: BorderRadius.circular(8),
    ),
  );

  static final PinTheme focusedPinTheme = defaultPinTheme.copyDecorationWith(
    border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
    borderRadius: BorderRadius.circular(8),
  );

  static final PinTheme submittedPinTheme = defaultPinTheme.copyWith(
    decoration: defaultPinTheme.decoration?.copyWith(
      color: const Color.fromRGBO(234, 239, 243, 1),
    ),
  );

  static Widget buildPinInput({
    required Function(String) onCompleted,
    int length = 6,
  }) {
    return Pinput(
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      length: length,
      // validator: (s) => s == '222222' ? null : 'Pin is incorrect',
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: onCompleted,
    );
  }
}
