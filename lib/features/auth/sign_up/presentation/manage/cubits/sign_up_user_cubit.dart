import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/sign_up_repo.dart';
import 'sign_up_state.dart';

class SignUpUserCubit extends Cubit<SignUpState> {
  SignUpUserCubit({required this.signUpRepo}) : super(SignUpInitial());

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
    emit(SignUpLoading());
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
      (l) => emit(SignUpFailure(l.errorMessage)),
      (r) => emit(SignUpSuccess(r.message!)),
    );
  }
}
