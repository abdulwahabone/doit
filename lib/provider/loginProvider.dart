import 'package:doit/utils/sharedPrefs.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool _isUserAuthenticated = SharedPrefs().isUserAuthenticated;

  bool get isUserAuthenticated => _isUserAuthenticated;
}
