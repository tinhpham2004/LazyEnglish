import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static const String _kAuthKey = 'auth';
  static const String _kEnglishLevelKey = 'english_level';

  static Future<void> setAuth() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kAuthKey, true);
  }

  static Future<bool?> getAuth() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_kAuthKey);
  }

  static Future<void> removeAuth() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_kAuthKey);
    await prefs.remove(_kEnglishLevelKey);
  }

  static Future<void> setEnglishLevel(String level) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kEnglishLevelKey, level);
  }

  static Future<String?> getEnglishLevel() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_kEnglishLevelKey);
  }
}
