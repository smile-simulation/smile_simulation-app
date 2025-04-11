sealed class SignUpUserState {}

final class SignUpUserInitial extends SignUpUserState {}

final class SignUpUserLoading extends SignUpUserState {}

final class SignUpUserSuccess extends SignUpUserState {
  final String message;

  SignUpUserSuccess(this.message);
}

final class SignUpUserFailure extends SignUpUserState {
  final String message;

  SignUpUserFailure(this.message);
}
