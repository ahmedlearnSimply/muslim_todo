import 'package:hive/hive.dart';

class AppLocalStorage {
  static late Box _prayerBox;

  // Initialize Hive
  static init() {
    _prayerBox = Hive.box('prayerBox');
  }

  // Cache data
  static void cacheData(String key, dynamic value) {
    _prayerBox.put(key, value);
  }

  // Get cached data
  static dynamic getCachedData(String key) {
    return _prayerBox.get(key);
  }
}
