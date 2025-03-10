import 'package:flutter/material.dart';
import 'package:smile_simulation/core/database/cache/cache_helper.dart';
import 'package:smile_simulation/core/services/app_keys.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/home_view.dart';

Future<void> main() async {
  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     statusBarColor: Colors.transparent,
  //     statusBarIconBrightness: Brightness.light, // أيقونات بيضاء
  //     systemNavigationBarColor: AppColors.whiteColor,
  //     systemNavigationBarIconBrightness: Brightness.light,
  //   ),
  // );
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
      // theme: ThemeData(
      //   bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //     selectedItemColor: AppColors.primaryColor,
      //     unselectedItemColor: Colors.grey,
      //     selectedLabelStyle: const TextStyle(
      //       fontWeight: FontWeight.bold,
      //       fontSize: 14,
      //     ),
      //     unselectedLabelStyle: const TextStyle(
      //       fontWeight: FontWeight.normal,
      //       fontSize: 12,
      //     ),
      //   ),
      // ),
      title: 'Smile Simulation',
      color: AppColors.primaryColor,
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}
