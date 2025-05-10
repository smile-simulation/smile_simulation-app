import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/constant.dart';
import 'package:smile_simulation/core/helper_functions/custom_error.dart';
import 'package:smile_simulation/features/auth/login/presentation/manage/cubits/login_cubit/login_cubit.dart';
import 'package:smile_simulation/features/auth/login/presentation/view/widgets/login_view_body.dart';
import '../../../../../core/database/cache/cache_helper.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/bottom_navigation_bar/bottom_nvaigation_view.dart';
import '../../../../../core/widgets/custom_auth_appbar.dart';
import '../../../../../generated/l10n.dart';
import '../../../sign_up/presentation/view/manage_sign_up.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);
  static const routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context),
      bottomNavigationBar: Container(
        height: 60,
        color: AppColors.whiteColor,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).noAccount,
                style: AppTextStyles.caption1(context),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, ManageSignUpView.routeName);
                },
                child: Text(
                  S.of(context).registerNow,
                  style: AppTextStyles.caption1(
                    context,
                  ).copyWith(color: AppColors.primaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) async {
          if (state is LoginSuccess) {
            await customSuccess(context, massage: state.message);
            CacheHelper.sharedPreferences.setBool(
              isSuccessLogin,
              true,
            );
            Navigator.pushReplacementNamed(
              context,
              BottomNavigationView.routeName,
            );

          }
          if (state is LoginFailure) {
            customError(context, massage: state.message);
          }
        },
        builder: (context, state) {
          return LogInViewBody();
        },
      ),
    );
  }
}
