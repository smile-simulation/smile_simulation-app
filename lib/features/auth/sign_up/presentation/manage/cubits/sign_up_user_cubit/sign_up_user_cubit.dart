import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/repos/sign_up_repo.dart';
import 'sign_up_user_state.dart';

class SignUpUserCubit extends Cubit<SignUpUserState> {
  SignUpUserCubit({required this.signUpRepo}) : super(SignUpUserInitial());

  final SignUpRepo signUpRepo;

  Future<void> signUpFromUser({
    required String email,
    required String password,
    required String confirmPassword,
    required String fullName,
    required int age,
    required String image,
    required String gender,
  }) async {
    emit(SignUpUserLoading());
    final result = await signUpRepo.signUpFromUser(
      fullName: fullName,
      age: age,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      image: image,
      gender: gender,
    );

    result.fold(
      (l) => emit(SignUpUserFailure(l.errorMessage)),
      (r) => emit(SignUpUserSuccess(r.message!)),
    );
  }
}
