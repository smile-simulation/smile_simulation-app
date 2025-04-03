String? validatorOfEmail(String? value) {
  if (value == null || value.isEmpty) {
    return "يرجى إدخال البريد الإلكتروني";
  } else if (value.contains(
    RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ),
  )) {
    return null;
  } else {
    return "يرجى إدخال بريد إلكتروني صالح";
  }
}

String? validatorOfPassword(String? value) {
  RegExp regex = RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$',
  );
  if (value == null || value.isEmpty) {
    return 'يجب إدخال كلمة المرور';
  } else {
    if (!regex.hasMatch(value)) {
      if (!RegExp(r'[A-Z]').hasMatch(value)) {
        return 'يجب أن تحتوي على حرف كبير واحد على الأقل [A-Z]';
      }
      if (!RegExp(r'[a-z]').hasMatch(value)) {
        return 'يجب أن تحتوي على حرف صغير واحد على الأقل [a-z]';
      }
      if (!RegExp(r'[0-9]').hasMatch(value)) {
        return 'يجب أن تحتوي على رقم واحد على الأقل [0-9]';
      }
      if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
        return 'يجب أن تحتوي على رمز خاص واحد على الأقل [@-#-..]';
      }
      if (value.length < 8) {
        return 'يجب أن تكون على الأقل 8 أحرف';
      }
      return null;
    } else {
      return null;
    }
  }
}

String? validatorOfName(String? value) {
  if (value == null || value.isEmpty) {
    return "يرجى إدخال الاسم";
  } else {
    return null;
  }
}

String? validatorOfAge(String? value) {
  if (value == null || value.isEmpty) {
    return "يرجى إدخال العمر";
  } else if (int.tryParse(value) == null) {
    return "يرجى إدخال رقم صالح للعمر";
  } else if (int.parse(value) < 18) {
    return "يجب أن يكون العمر 18 سنة أو أكثر";
  } else {
    return null;
  }
}
