import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smile_simulation/features/auth/login/data/repos/login_repo/login_repo.dart'
    show LoginRepo;
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;

  LoginCubit({required this.loginRepo}) : super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    final result = await loginRepo.login(email: email, password: password);
    result.fold(
      (l) => emit(LoginFailure(l.errorMessage)),
      (r) => emit(LoginSuccess(r.message!)),
    );
  }
}
