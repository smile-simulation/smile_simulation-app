import 'package:smile_simulation/core/database/cache/cache_helper.dart';
import 'package:smile_simulation/core/services/app_keys.dart';
import 'package:smile_simulation/core/utils/app_translation.dart';

class LocalizationHelper {
  static String get currentLanguage => CacheHelper().getData(key: AppKeys.languageCode) ?? 'en';

  static String translate(String key) {
    return appTranslation[currentLanguage]?[key] ?? key;
  }

  static Future<void> changeLanguage(String languageCode) async {
    await CacheHelper().saveData(key: AppKeys.languageCode, value: languageCode);
  }
}