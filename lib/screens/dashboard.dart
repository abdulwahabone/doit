import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:doit/common/buttons/logoutButton.dart';
import 'package:doit/common/snackBar/appSnackBar.dart';
import 'package:doit/provider/LoginProvider.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Future<void> _logout() async {
    await Provider.of<LoginProvider>(context, listen: false)
        .logout()
        .catchError(
          (e) => AppSnackBar().showSnackBar(context, e),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: SafeArea(
          minimum: const EdgeInsets.all(16.0),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final _topPadding = constraints.maxHeight * 0.05;

              return Column(
                children: [
                  LogoutButton(
                    onPressed: () => _logout(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: _topPadding),
                    child: Text('THIS IS DASHBAORD'),
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
