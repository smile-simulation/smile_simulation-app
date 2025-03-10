import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChrome, SystemUiOverlayStyle;
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/home_view.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light, // أيقونات بيضاء
      systemNavigationBarColor: AppColors.whiteColor,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SmileSimulation());
}

String? languageCode;

class SmileSimulation extends StatelessWidget {
  const SmileSimulation({super.key});
  @override
  Widget build(BuildContext context) {
    languageCode = 'ar';
    return MaterialApp(
      color: AppColors.primaryColor,
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}
