import 'package:flutter/material.dart';
import 'package:smile_simulation/features/auth/login/presentation/view/login_view.dart';
import 'package:smile_simulation/core/widgets/bottom_nvaigation_view.dart';

import '../../features/on_boarding/presentation/view/on_boarding_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());

    case LoginView.routeName:
      return MaterialPageRoute(builder: (_) => const LoginView());

    case BottomNavigationView.routeName:
      return MaterialPageRoute(builder: (_) => const BottomNavigationView());

    default:
      return MaterialPageRoute(builder: (_) => Container());
  }
}
