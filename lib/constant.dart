import 'package:logger/logger.dart';
import 'core/database/cache/cache_helper.dart';

const String isArabic = 'ar';
const isOnboardingViewSeen = 'isOnboardingViewSeen';
const isSuccessLogin = 'isSuccessLogin';
const sharedPrefForgetToken = 'sharedPrefForgetToken';
const userData = 'userData';
const personalData = 'personalData';
var logger = Logger();
String userId = CacheHelper().getMap(key: userData)!['userName'] ?? "";
String userType = CacheHelper().getMap(key: 'userData')!['role'] ?? "Patient";
