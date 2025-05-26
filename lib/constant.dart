import 'package:logger/logger.dart';
import 'core/database/cache/cache_helper.dart';

 String isArabic = CacheHelper.sharedPreferences.getString('language') ?? 'ar';
const isOnboardingViewSeen = 'isOnboardingViewSeen';
const isSuccessLogin = 'isSuccessLogin';
const sharedPrefForgetToken = 'sharedPrefForgetToken';
const userData = 'userData';
const personalData = 'personalData';
var logger = Logger(
  printer: PrettyPrinter(),
  level: Level.debug, // يمكنك تخصيص المستوى حسب الحاجة
);
String userId = CacheHelper().getMap(key: userData)?['userName'] ?? "moh";
String userType = CacheHelper().getMap(key: userData)?['role'] ?? "Patient";
