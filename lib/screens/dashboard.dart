import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:doit/common/buttons/logoutButton.dart';
import 'package:doit/common/snackBar/appSnackBar.dart';
import 'package:doit/common/text/heading.dart';
import 'package:doit/common/buttons/customFloatingActionButton.dart';
import 'package:doit/common/text/subHeading.dart';
import 'package:doit/common/list/listItem.dart';
import 'package:doit/common/fields/InputField.dart';
import 'package:doit/provider/LoginProvider.dart';
import 'package:doit/provider/dashboardProvider.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController newTaskController = new TextEditingController();
  String? username;

  @override
  void initState() {
    _fetchUserDetails();
    super.initState();
  }

  _fetchUserDetails() async {
    var dashboardProvider =
        Provider.of<DashboardProvider>(context, listen: false);
    dashboardProvider.fetchUserDetails();
  }

// Seperating api call function and update list, since api response delay.
  Future<void> _createTask() async {
    bool validate = _formKey.currentState!.validate();
    var dashboardProvider =
        Provider.of<DashboardProvider>(context, listen: false);
    if (validate) {
      await dashboardProvider
          .createTask(newTaskController.text)
          .whenComplete(() => Navigator.pop(context))
          .catchError((e) => AppSnackBar().showSnackBar(context, e));
      await dashboardProvider.postCreatedTask(newTaskController.text);
    }
  }

  Future<void> _logout() async {
    await Provider.of<LoginProvider>(context, listen: false)
        .logout()
        .catchError(
          (e) => AppSnackBar().showSnackBar(context, e),
        );
  }

  _openCreateTaskModal() {
    newTaskController.clear();
    Alert(
        context: context,
        title: "Create task",
        content: Form(
            key: _formKey,
            child: InputField(
              hintText: 'New Task',
              controller: newTaskController,
              icon: Icons.notes,
            )),
        buttons: [
          DialogButton(
            onPressed: () => _createTask(),
            child: Text(
              "Create",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            radius: BorderRadius.all(Radius.circular(20)),
          )
        ]).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () => _openCreateTaskModal(),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SafeArea(
          minimum: const EdgeInsets.all(16.0),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Column(
                children: [
                  LogoutButton(
                    onPressed: () => _logout(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Consumer<DashboardProvider>(
                      builder: (ctx, user, _) => Heading(
                        text: 'What\'s up, ${user.userName}!',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 20),
                    child: SubHeading(
                      text: 'Today\'s tasks',
                    ),
                  ),
                  Consumer<DashboardProvider>(
                    builder: (ctx, user, _) => Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.only(bottom: 200),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: user.userTasksList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListItem(
                            id: user.userTasksList[index].id,
                            title: user.userTasksList[index].title,
                            isCompleted: user.userTasksList[index].completed,
                            onCheck: (id, isCompleted) =>
                                user.checkTask(id, isCompleted),
                            onDelete: (id) => user.deleteTask(id),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
