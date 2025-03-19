import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:smile_simulation/core/database/cache/cache_helper.dart';
import 'package:smile_simulation/core/helper_functions/on_generate_route.dart';
import 'package:smile_simulation/core/services/app_keys.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:smile_simulation/generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const SmileSimulation());
}

class SmileSimulation extends StatelessWidget {
  const SmileSimulation({super.key});

  @override
  Widget build(BuildContext context) {
    CacheHelper().saveData(key: AppKeys.languageCode, value: 'ar');
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Cairo',
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.primaryColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primaryColor,
          surfaceTintColor: AppColors.primaryColor,
          centerTitle: true,
          elevation: 0,
        ),
      ),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale(CacheHelper().getData(key: AppKeys.languageCode)),
      title: 'Smile Simulation',
      color: AppColors.primaryColor,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: OnBoardingScreen.routeName,
    );
  }
}
