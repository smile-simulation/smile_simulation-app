import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/features/auth/login/presentation/view/login_view.dart';
import 'package:smile_simulation/features/auth/sign_up/presentation/manage/cubits/sign_up_user_cubit/sign_up_user_cubit.dart';

import '../../../../../core/helper_functions/custom_error.dart';
import '../manage/cubits/sign_up_user_cubit/sign_up_user_state.dart';
import 'widgets/sign_up_from_user_body_view.dart';

class SignUpFromUserView extends StatelessWidget {
  const SignUpFromUserView({Key? key}) : super(key: key);
  static const routeName = 'signUpFromUserView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAuthAppbar(context, isBack: true),

      body: BlocConsumer<SignUpUserCubit, SignUpUserState>(
        listener: (context, state) async {
          if (state is SignUpUserSuccess) {
            await customSuccess(context, massage: state.message);
            Navigator.pushNamedAndRemoveUntil(
              context,
              LoginView.routeName,
              (route) => false,
            );
          }
          if (state is SignUpUserFailure) {
            customError(context, massage: state.message);
          }
        },
        builder: (context, state) {
          return SignUpFromUserBodyView();
        },
      ),
    );
  }
}
