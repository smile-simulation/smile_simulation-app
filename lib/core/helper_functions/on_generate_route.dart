import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/api/dio_consumer.dart';
import 'package:smile_simulation/core/helper_functions/get_it.dart';
import 'package:smile_simulation/features/auth/login/presentation/view/login_view.dart';

import 'package:smile_simulation/core/widgets/bottom_navigation_bar/bottom_nvaigation_view.dart';
import 'package:smile_simulation/features/auth/sign_up/presentation/manage/cubits/sign_up_user_cubit.dart';

import 'package:smile_simulation/features/auth/sign_up/presentation/view/manage_sign_up.dart';

import '../../features/auth/sign_up/presentation/view/forgot_view.dart';
import '../../features/auth/sign_up/presentation/view/sign_up_from_doctor_subsidiary_view.dart';
import '../../features/auth/sign_up/presentation/view/sign_up_from_doctor_view.dart';
import '../../features/auth/sign_up/presentation/view/sign_up_from_user_view.dart';
import '../../features/on_boarding/presentation/view/on_boarding_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());

    case LoginView.routeName:
      return MaterialPageRoute(builder: (_) => const LoginView());

    case ManageSignUpView.routeName:
      return MaterialPageRoute(builder: (_) => const ManageSignUpView());

    case SignUpFromUserView.routeName:
      return MaterialPageRoute(
        builder:
            (_) => BlocProvider(
              create:
                  (context) =>
                      SignUpUserCubit(dioConsumer: getIt<DioConsumer>(),),
              child: SignUpFromUserView(),
            ),
      );

    case SignUpFromDoctorView.routeName:
      return MaterialPageRoute(builder: (_) => const SignUpFromDoctorView());

    case SignUpFromDoctorSubsidiaryView.routeName:
      return MaterialPageRoute(
        builder: (_) => const SignUpFromDoctorSubsidiaryView(),
      );

    case ForgetView.routeName:
      return MaterialPageRoute(builder: (_) => const ForgetView());

    case BottomNavigationView.routeName:
      return MaterialPageRoute(builder: (_) => const BottomNavigationView());

    default:
      return MaterialPageRoute(builder: (_) => Container());
  }
}
