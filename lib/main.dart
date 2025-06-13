import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'features/no_internet.dart'; // مسار شاشة الإنترنت حسب مشروعك
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smile_simulation/constant.dart';
import 'package:smile_simulation/core/database/cache/cache_helper.dart';
import 'package:smile_simulation/core/helper_functions/on_generate_route.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/widgets/bottom_navigation_bar/bottom_nvaigation_view.dart';
import 'package:smile_simulation/generated/l10n.dart';
import 'package:smile_simulation/core/helper_functions/get_it.dart';
import 'package:smile_simulation/core/services/bloc_opesever.dart';
import 'package:smile_simulation/core/services/local_notification_service.dart';
import 'package:smile_simulation/features/auth/login/presentation/view/login_view.dart';
import 'package:smile_simulation/features/on_boarding/presentation/view/on_boarding_view.dart';

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

  runApp(const ConnectivityAppWrapper());

  WidgetsBinding.instance.allowFirstFrame();
}

class ConnectivityAppWrapper extends StatefulWidget {
  const ConnectivityAppWrapper({super.key});

  @override
  _ConnectivityAppWrapperState createState() => _ConnectivityAppWrapperState();
}

class _ConnectivityAppWrapperState extends State<ConnectivityAppWrapper> with WidgetsBindingObserver {
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  bool hasInternet = true;
  List<ConnectivityResult> _lastResult = [ConnectivityResult.none];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _checkConnectivity();
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .debounceTime(const Duration(milliseconds: 500)) // Debounce rapid events
        .listen(
          (List<ConnectivityResult> result) {
            if (result.toString() != _lastResult.toString()) {
              _lastResult = result;
              _checkConnectivity();
            }
          },
        );
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      _checkConnectivity();
    }
  }

  Future<void> _checkConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        hasInternet = false;
      });
      return;
    }

    try {
      final response = await Dio()
          .get('https://www.google.com')
          .timeout(const Duration(seconds: 5), onTimeout: () {
        return Response(
          requestOptions: RequestOptions(path: 'https://www.google.com'),
          statusCode: 408,
        );
      });
      setState(() {
        hasInternet = response.statusCode == 200;
      });
    } catch (e) {
      setState(() {
        hasInternet = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return hasInternet ? const SmileSimulation() : const NoInternetAppWrapper();
  }
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
          initialRoute: CacheHelper.sharedPreferences.getBool(isSuccessLogin) == true
              ? BottomNavigationView.routeName
              : CacheHelper.sharedPreferences.getBool(isOnboardingViewSeen) == true
                  ? LoginView.routeName
                  : OnBoardingView.routeName,
        );
      },
    );
  }
}

class NoInternetAppWrapper extends StatelessWidget {
  const NoInternetAppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale>(
      valueListenable: isArabic,
      builder: (context, locale, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: locale,
          home: const NoInternetScreen(),
        );
      },
    );
  }
}