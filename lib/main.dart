import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:smile_simulation/core/database/cache/cache_helper.dart';
import 'package:smile_simulation/core/services/app_keys.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/home_view.dart';
import 'package:smile_simulation/generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  runApp(const SmileSimulation());
}

class SmileSimulation extends StatelessWidget {
  const SmileSimulation({super.key});
  @override
  Widget build(BuildContext context) {
    CacheHelper().saveData(key: AppKeys.languageCode, value: 'ar');
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale('ar'),
      title: 'Smile Simulation',
      color: AppColors.primaryColor,
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}
