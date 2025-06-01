import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/helper_functions/custom_error.dart';

import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';

import 'package:smile_simulation/features/auth/login/presentation/view/login_view.dart';
import 'package:smile_simulation/features/auth/sign_up/presentation/view/widgets/sign_up_from_doctor_subsidiary_body_view.dart';

import '../manage/cubits/sign_up_doctor_cubit/sign_up_doctor_cubit.dart';
import '../manage/cubits/sign_up_doctor_cubit/sign_up_doctor_state.dart';

class SignUpFromDoctorSubsidiaryView extends StatelessWidget {
  const SignUpFromDoctorSubsidiaryView({
    super.key,
    required this.name,
    required this.email,
    required this.password,
    required this.gender,

    required this.cardImage,
    required this.isCorrect,
    required this.confirmPassword,
    required this.address,
  });

  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final int gender;
  final String address;

  final File cardImage;
  final bool isCorrect;

  static const routeName = '/sign-up-from-doctor-subsidiary';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, isBack: true),
      body: BlocConsumer<SignUpDoctorCubit, SignUpDoctorState>(
        listener: (context, state) async {
          if (state is SignUpDoctorSuccess) {
            await customSuccess(context, massage: state.message);
            Navigator.pushNamedAndRemoveUntil(
              context,
              LoginView.routeName,
              (route) => false,
            );
          }
          if (state is SignUpDoctorFailure) {
            await customError(context, massage: state.message);
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return SignUpFromDoctorSubsidiaryBodyView(
            name: name,
            email: email,
            password: password,
            confirmPassword: confirmPassword,
            gender: gender,
            cardImage: cardImage,
            isCorrect: isCorrect,
            address: address,
          );
        },
      ),
    );
  }
}
