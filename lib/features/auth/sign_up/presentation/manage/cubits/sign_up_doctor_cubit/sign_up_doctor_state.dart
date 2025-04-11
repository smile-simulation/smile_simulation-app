sealed class SignUpDoctorState {}

final class SignUpDoctorInitial extends SignUpDoctorState {}

final class SignUpDoctorLoading extends SignUpDoctorState {}

final class SignUpDoctorSuccess extends SignUpDoctorState {
  final String message;

  SignUpDoctorSuccess(this.message);
}

final class SignUpDoctorFailure extends SignUpDoctorState {
  final String message;

  SignUpDoctorFailure(this.message);
}
