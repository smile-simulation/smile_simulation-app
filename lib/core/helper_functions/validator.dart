import '../../generated/l10n.dart';

String? validatorOfEmail(context, String? value) {
  if (value == null || value.isEmpty) {
    return S.of(context).email_empty;
  } else if (value.contains(
    RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ),
  )) {
    return null;
  } else {
    return S.of(context).email_invalid;
  }
}

String? validatorOfPassword(context, String? value) {
  RegExp regex = RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$',
  );
  if (value == null || value.isEmpty) {
    return S.of(context).password_empty;
  } else {
    if (!regex.hasMatch(value)) {
      if (!RegExp(r'[A-Z]').hasMatch(value)) {
        return S.of(context).password_uppercase;
      }
      if (!RegExp(r'[a-z]').hasMatch(value)) {
        return S.of(context).password_lowercase;
      }
      if (!RegExp(r'[0-9]').hasMatch(value)) {
        return S.of(context).password_number;
      }
      if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
        return S.of(context).password_special;
      }
      if (value.length < 8) {
        return S.of(context).password_min_length;
      }
      return null;
    } else {
      return null;
    }
  }
}

String? validatorOfName(context, String? value) {
  if (value == null || value.isEmpty) {
    return S.of(context).name_empty;
  } else if (value.length < 3) {
    return S.of(context).name_full;
  } else if (value is int) {
    return S.of(context).name_valid;
    ;
  } else if (value.contains(RegExp(r'[0-9]'))) {
    return S.of(context).name_valid;
    ;
  } else if (value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    return S.of(context).name_valid;
    ;
  } else {
    return null;
  }
}

String? validatorOfAge(context, String? value) {
  if (value == null || value.isEmpty) {
    return S.of(context).age_empty;
  } else if (int.tryParse(value) == null) {
    return S.of(context).age_valid;
  } else if (int.parse(value) < 12) {
    return S.of(context).age_min;
  } else if (int.parse(value) > 70) {
    return S.of(context).age_max;
  } else {
    return null;
  }
}

String? validatorOfPhone(context, String? value) {
  if (value == null || value.isEmpty) {
    return S.of(context).phone_empty;
  } else if (value.length < 10) {
    return S.of(context).phone_valid;
  } else if (value.length > 11) {
    return S.of(context).phone_valid;
  } else {
    return null;
  }
}
