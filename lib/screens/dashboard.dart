import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:doit/common/buttons/logoutButton.dart';
import 'package:doit/common/snackBar/appSnackBar.dart';
import 'package:doit/common/text/heading.dart';
import 'package:doit/common/buttons/customFloatingActionButton.dart';
import 'package:doit/common/text/subHeading.dart';
import 'package:doit/provider/LoginProvider.dart';
import 'package:doit/provider/dashboardProvider.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String? username;

  @override
  void initState() {
    _fetchUserDetails();
    super.initState();
  }

  _fetchUserDetails() async {
    var dashboardProvider =
        Provider.of<DashboardProvider>(context, listen: false);
    dashboardProvider.fetchUserDetails().whenComplete(() {
      setState(() => username = dashboardProvider.userName!);
    });
  }

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
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () => print('FAB pressed'),
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
                        text: 'What\'s up, $username!',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: SubHeading(
                      text: 'Today\'s tasks',
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
