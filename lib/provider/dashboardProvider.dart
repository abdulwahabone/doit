import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:doit/constants/errorMessages.dart';
import 'package:doit/constants/apis.dart';

class DashboardProvider extends ChangeNotifier {
  final loginProvider;
  String userName = '';

  DashboardProvider({
    this.loginProvider,
  });

  Future<void> fetchUserDetails() async {
    Uri url = Uri.parse(baseUrl + '/users/${loginProvider.userToken}');
    try {
      var response = await http.get(url);
      final responseData = json.decode(response.body);
      if (responseData.isEmpty) return Future.error(unableToFetchUserDetails);
      userName = responseData['username'];
      notifyListeners();
    } catch (e) {
      Future.error(e.toString());
    }
  }
}
