import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences? _sharedPrefs;

  factory SharedPrefs() => SharedPrefs._internal();

  SharedPrefs._internal();

  Future<void> init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  String get userId => _sharedPrefs?.getString("userId") ?? "";
  String get name => _sharedPrefs?.getString("name") ?? "";
  String get job => _sharedPrefs?.getString("job") ?? "";
  String get createdAt => _sharedPrefs?.getString("createdAt") ?? "";

  bool get isLoggedIn => _sharedPrefs?.getBool("isLoggedIn") ?? false;

  get clear => _sharedPrefs?.clear();

  set userId(String value) {
    _sharedPrefs?.setString("userId", value);
  }

  set isLoggedIn(bool value) {
    _sharedPrefs?.setBool("isLoggedIn", value);
  }

  set name(String value) {
    _sharedPrefs?.setString("name", value);
  }

  set caretedAt(String value) {
    _sharedPrefs?.setString("createdAt", value);
  }

  set job(String value) {
    _sharedPrefs?.setString("job", value);
  }
}
