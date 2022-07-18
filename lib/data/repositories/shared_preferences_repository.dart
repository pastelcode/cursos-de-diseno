import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepository {
  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static String? getString({required String key}) {
    final value = _preferences.getString(key);
    return value;
  }

  static setString({required String key, required String value}) {
    _preferences.setString(key, value);
  }

  static clear({String? key}) {
    if (key is String) {
      _preferences.remove(key);
      return;
    }
    _preferences.clear();
  }
}
