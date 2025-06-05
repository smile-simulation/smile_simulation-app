import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:smile_simulation/constant.dart';
import 'package:smile_simulation/core/database/cache/cache_helper.dart';
import 'package:smile_simulation/core/helper_functions/on_generate_route.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/widgets/bottom_navigation_bar/bottom_nvaigation_view.dart';
import 'package:smile_simulation/generated/l10n.dart';

import 'core/helper_functions/get_it.dart';
import 'core/services/bloc_opesever.dart';
import 'core/services/local_notification_service.dart';
import 'features/auth/login/presentation/view/login_view.dart';
import 'features/on_boarding/presentation/view/on_boarding_view.dart';

ValueNotifier<Locale> isArabic = ValueNotifier(
  Locale(CacheHelper.sharedPreferences.getString('language') ?? 'ar'),
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding.instance.deferFirstFrame();
  await Firebase.initializeApp();
  await CacheHelper().init();
  LocalNotificationService.initialize();
  await LocalNotificationService.requestNotificationPermission();
  Bloc.observer = CustomBlocObserver();
  setupGetIt();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const SmileSimulation());

  WidgetsBinding.instance.allowFirstFrame();
}

class SmileSimulation extends StatelessWidget {
  const SmileSimulation({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale>(
      valueListenable: isArabic,
      builder: (context, locale, _) {
        return MaterialApp(
          theme: ThemeData(
            fontFamily: 'Cairo',
            primaryColor: AppColors.primaryColor,
            scaffoldBackgroundColor: AppColors.whiteColor,
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.primaryColor,
              surfaceTintColor: AppColors.primaryColor,
              centerTitle: true,
              elevation: 0,
            ),
          ),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: locale,
          title: 'Smile Simulation',
          color: AppColors.primaryColor,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: onGenerateRoute,
          initialRoute:
              CacheHelper.sharedPreferences.getBool(isSuccessLogin) == true
                  ? BottomNavigationView.routeName
                  : CacheHelper.sharedPreferences.getBool(
                        isOnboardingViewSeen,
                      ) ==
                      true
                  ? LoginView.routeName
                  : OnBoardingView.routeName,
        );
      },
    );
  }
}
