import 'package:shared_preferences/shared_preferences.dart';

class LocaleManager {
  static LocaleManager _instance = LocaleManager._init();

  SharedPreferences _preferences;

  static LocaleManager get instance => _instance;

  LocaleManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }

  static preferencesInit() async {
    if (instance._preferences == null) {
      instance._preferences = await SharedPreferences.getInstance();
    }
    return;
  }

  Future<void> setStringValue(String key, String value) async {
    await _preferences.setString(key, value);
  }

  String getStringValue(String key) => _preferences.getString(key);

  Future<void> setIsLoggedIn(bool state) async {
    await _preferences.setBool("isLoggedIn", state);
  }

  Future<void> getIsLoggedIn() async {
    await _preferences.getBool("isLoggedIn");
  }
}
