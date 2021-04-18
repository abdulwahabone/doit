import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:doit/constants/errorMessages.dart';
import 'package:doit/constants/apis.dart';
import 'package:doit/models/taskModel.dart';

class DashboardProvider extends ChangeNotifier {
  DashboardProvider({
    this.loginProvider,
  });

  final loginProvider;
  String userName = '';
  List<TaskModel> userTasksList = List<TaskModel>.empty(growable: true);
  Map<String, String> headers = {'Content-Type': 'application/json'};

  List<TaskModel> parseTasks(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<TaskModel>((json) => TaskModel.fromJson(json)).toList();
  }

  Future<void> fetchUserTasks() async {
    var _userId = loginProvider.userToken;
    Uri url = Uri.parse(baseUrl + '/todos?userId=$_userId');
    try {
      var response = await http.get(url);
      final responseData = json.decode(response.body);
      if (responseData.isEmpty) return Future.error(unableToFetchUserDetails);
      userTasksList = parseTasks(response.body);
      notifyListeners();
    } catch (e) {
      Future.error(e.toString());
    }
  }

  Future<void> fetchUserDetails() async {
    var _userId = loginProvider.userToken;
    Uri url = Uri.parse(baseUrl + '/users/$_userId');
    try {
      var response = await http.get(url);
      final responseData = json.decode(response.body);
      if (responseData.isEmpty) return Future.error(unableToFetchUserDetails);
      userName = responseData['username'];
      notifyListeners();
      await fetchUserTasks();
    } catch (e) {
      Future.error(e.toString());
    }
  }

  Future<void> checkTask(int taskId, bool isCompleted) async {
    userTasksList.firstWhere((item) => item.id == taskId).completed =
        !isCompleted;
    notifyListeners();
    Uri url = Uri.parse(baseUrl + '/todos/$taskId');
    try {
      var payload = json.encode({'completed': !isCompleted});
      var response = await http.patch(url, headers: headers, body: payload);
      final responseData = json.decode(response.body);
      if (responseData.isEmpty) return Future.error(unableToFetchUserDetails);
    } catch (e) {
      Future.error(e.toString());
    }
  }

  Future<void> deleteTask(int taskId) async {
    userTasksList.removeWhere((item) => item.id == taskId);
    notifyListeners();
    Uri url = Uri.parse(baseUrl + '/todos/$taskId');
    try {
      await http.delete(url);
    } catch (e) {
      Future.error(e.toString());
    }
  }
}
