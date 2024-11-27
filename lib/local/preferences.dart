import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static const String _kAuthKey = 'auth';

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
  }
}
