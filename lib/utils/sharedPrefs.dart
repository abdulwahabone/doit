import 'package:doit/constants/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences? _sharedPrefs;
  factory SharedPrefs() => SharedPrefs._internal();
  SharedPrefs._internal();

  Future<void> init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  int? _authToken = _sharedPrefs?.getInt(keyAuthToken);

  Future<void> setAuthToken(int authToken) async {
    _sharedPrefs?.setInt(keyAuthToken, authToken);
  }

  Future<void> clear() async {
    _sharedPrefs?.clear();
  }

  int? get authToken => _authToken;

  bool get isUserAuthenticated => _authToken != null;
}
