import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:doit/constants/apis.dart';
import 'package:doit/utils/sharedPrefs.dart';
import 'package:doit/constants/errorMessages.dart';

class LoginProvider extends ChangeNotifier {
  int? userToken = SharedPrefs().authToken;
  bool isUserAuthenticated = SharedPrefs().isUserAuthenticated;

  bool get userAuthenticated => isUserAuthenticated;

  Future<void> signIn(String email, String password) async {
    Uri url = Uri.parse(baseUrl + '/users/?email=${email.capitalize()}');
    try {
      var response = await http.get(url);
      final responseData = json.decode(response.body) as List;
      if (responseData.isEmpty)
        return Future.error(inValidCredentialsErrorMessage);
      int userId = responseData[0]['id'];
      userToken = userId;
      isUserAuthenticated = true;
      SharedPrefs().setAuthToken(userId);
      notifyListeners();
    } catch (e) {
      Future.error(e.toString());
    }
  }

  Future<void> logout() async {
    try {
      isUserAuthenticated = false;
      userToken = null;
      SharedPrefs().clear();
      notifyListeners();
    } catch (e) {
      Future.error(e.toString());
    }
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
