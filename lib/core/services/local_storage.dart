import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {
  static late SharedPreferences pref;
  init() async {
    pref = await SharedPreferences.getInstance();
  }

  static cashData(key, value) {
    if (value is int) {
      pref.setInt(key, value);
    }
    if (value is bool) {
      pref.setBool(key, value);
    }
    if (value is String) {
      pref.setString(key, value);
    }
    if (value is double) {
      pref.setDouble(key, value);
    }
  }

  getCashData(key) {
    return pref.get(key);
  }
}
