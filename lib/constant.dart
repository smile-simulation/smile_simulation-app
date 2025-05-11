import 'package:logger/logger.dart';
import 'core/database/cache/cache_helper.dart';

const String isArabic = 'ar';
const isOnboardingViewSeen = 'isOnboardingViewSeen';
const isSuccessLogin = 'isSuccessLogin';
const sharedPrefForgetToken = 'sharedPrefForgetToken';
const userData = 'userData';
var logger = Logger();
String userType = CacheHelper().getMap(key: 'userData')!['rule'] ?? "user";
