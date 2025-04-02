

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/api/end_point.dart';
import '../../../../../../core/api/api_keys.dart';
import '../../../../../../core/api/dio_consumer.dart';
import '../../../../../../core/errors/exceptions.dart';
import '../../../data/model/Sign_up_model.dart';
import 'sign_up_state.dart';

class SignUpUserCubit extends Cubit<SignUpState> {
  SignUpUserCubit({required this.dioConsumer}) : super(SignUpInitial());
  final DioConsumer dioConsumer;

  SignUpModel? signUpModel;

  GlobalKey<FormState> signUpFormKey = GlobalKey();
  TextEditingController signUpFullName = TextEditingController();
  TextEditingController signUpAge = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();
  TextEditingController signUpPasswordConfirm = TextEditingController();

  signUp() async {
    emit(SignUpLoading());
    try {
      var response = await dioConsumer
          .post(EndPoint.signUpUser, data: {
        ApiKeys.fullName: signUpFullName.text,
        ApiKeys.age: signUpAge.text,
        ApiKeys.email: signUpEmail.text,
        ApiKeys.password: signUpPassword.text,
        ApiKeys.confirmPassword: signUpPassword.text
      },formData: true);
      if (response['success'] == true) {
        emit(SignUpSuccess());
      } else {
        emit(SignUpError(response['message']));
      }
    } on ServerException catch (e) {
      emit(
        SignUpError(
          e.errorModel.message!,
        ),
      );
    }
  }
}
