import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
