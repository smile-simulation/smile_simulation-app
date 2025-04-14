part of 'forget_password_cubit.dart';

@immutable
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class SendCodeInitial extends ForgetPasswordState {}

final class SendCodeLoading extends ForgetPasswordState {}

final class SendCodeSuccess extends ForgetPasswordState {
  final String message;

  SendCodeSuccess(this.message);
}

final class SendCodeFailure extends ForgetPasswordState {
  final String message;

  SendCodeFailure(this.message);
}

final class ConfirmNumInitial extends ForgetPasswordState {}

final class ConfirmNumSuccess extends ForgetPasswordState {
  final String message;

  ConfirmNumSuccess(this.message);
}

final class ConfirmNumFailure extends ForgetPasswordState {
  final String message;

  ConfirmNumFailure(this.message);
}

final class ConfirmNumLoading extends ForgetPasswordState {}

final class ChangePasswordInitial extends ForgetPasswordState {}

final class ChangePasswordLoading extends ForgetPasswordState {}

final class ChangePasswordSuccess extends ForgetPasswordState {
  final String message;

  ChangePasswordSuccess(this.message);
}

final class ChangePasswordFailure extends ForgetPasswordState {
  final String message;

  ChangePasswordFailure(this.message);
}
