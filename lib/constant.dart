import 'package:logger/logger.dart';
import 'core/database/cache/cache_helper.dart';


const isOnboardingViewSeen = 'isOnboardingViewSeen';
const isSuccessLogin = 'isSuccessLogin';
const sharedPrefForgetToken = 'sharedPrefForgetToken';
const userData = 'userData';
var logger = Logger(printer: PrettyPrinter(), level: Level.debug);
String userId = CacheHelper().getMap(key: userData)?['userName'] ?? "";
String userType = CacheHelper().getMap(key: userData)?['role'] ?? "Patient";

