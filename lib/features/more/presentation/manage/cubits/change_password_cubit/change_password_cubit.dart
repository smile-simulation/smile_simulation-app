import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/repos/change_password_repos/change_password_repo.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this.changePasswordRepo) : super(ChangePasswordInitial());

  final ChangePasswordRepo changePasswordRepo;

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    emit(ChangePasswordLoading());
    final result = await changePasswordRepo.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
      confirmNewPassword: confirmNewPassword,
    );

    result.fold(
      (l) => emit(ChangePasswordFailure(l.errorMessage)),
      (r) => emit(ChangePasswordSuccess(r.message!)),
    );
  }
}
