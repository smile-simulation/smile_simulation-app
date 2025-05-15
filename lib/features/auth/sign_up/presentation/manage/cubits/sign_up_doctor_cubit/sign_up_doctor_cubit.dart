import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/features/auth/sign_up/presentation/manage/cubits/sign_up_doctor_cubit/sign_up_doctor_state.dart';
import '../../../../data/repos/sign_up_repo.dart';

class SignUpDoctorCubit extends Cubit<SignUpDoctorState> {
  SignUpDoctorCubit({required this.signUpRepo}) : super(SignUpDoctorInitial());

  final SignUpRepo signUpRepo;

  Future<void> signUpFromDoctor({
    required String email,
    required String password,
    required String confirmPassword,
    required String fullName,
    required int experience,
    required File image,
    required File card,
    required String gender,
    required bool isCorrect,
    required String qualification,
    required String specialization,
  }) async {
    emit(SignUpDoctorLoading());
    final result = await signUpRepo.signUpFromDoctor(
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      fullName: fullName,
      experience: experience,
      card: card,
      gender: gender,
      isCorrect: isCorrect,
      qualification: qualification,
      specialization: specialization,
    );

    result.fold(
      (l) => emit(SignUpDoctorFailure(l.errorMessage)),
      (r) => emit(SignUpDoctorSuccess(r.message!)),
    );
  }
}
