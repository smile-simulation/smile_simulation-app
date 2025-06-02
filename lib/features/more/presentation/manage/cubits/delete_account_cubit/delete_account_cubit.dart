import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/repos/delete_account_repos/delete_account_repo.dart';

part 'delete_account_state.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  DeleteAccountCubit(this.deleteAccountRepo) : super(DeleteAccountInitial());

  final DeleteAccountRepo deleteAccountRepo ;

  Future<void> deleteAccount({
    required String email,

  }) async {
    emit(DeleteAccountLoading());
    final result = await deleteAccountRepo.deleteAccount(
      email: email
    );

    result.fold(
      (l) => emit(DeleteAccountFailure(l.errorMessage)),
      (r) => emit(DeleteAccountSuccess(r.message!)),
    );
  }
}
