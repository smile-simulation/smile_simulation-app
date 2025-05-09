import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/repos/forget_repos/forget_password_repo.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.forgetPasswordRepo) : super(ForgetPasswordInitial());

  final ForgetPasswordRepo forgetPasswordRepo;

  void sendCode({required String email}) async {
    emit(SendCodeLoading());

    final result = await forgetPasswordRepo.forgetPassword(email: email);

    result.fold(
      (l) => emit(SendCodeFailure(l.errorMessage)),
      (r) => emit(SendCodeSuccess(r.message!)),
    );
  }

  confirmNum({required String email, required String codeOTP}) async {
    emit(ConfirmNumLoading());

    final result = await forgetPasswordRepo.verifyOTP(
      email: email,
      codeOTP: codeOTP,
    );

    result.fold(
      (l) => emit(ConfirmNumFailure(l.errorMessage)),
      (r) => emit(ConfirmNumSuccess(r.message!)),
    );
  }

  Future<void> changePassword({
    required String email,
    required String token,
    required String newPassword,
    required String confirmPassword,
  }) async {
    emit(ChangePasswordLoading());
    final result = await forgetPasswordRepo.resetPassword(
      email: email,
      token: token,
      password: newPassword,
      confirmPassword: confirmPassword,
    );

    result.fold(
      (l) => emit(ChangePasswordFailure(l.errorMessage)),
      (r) => emit(ChangePasswordSuccess(r.message!)),
    );
  }
}
