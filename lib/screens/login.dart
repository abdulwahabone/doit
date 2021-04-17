import 'package:doit/common/lottie/loginHeaderImage.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: SafeArea(
          minimum: const EdgeInsets.all(16.0),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              const double _buttonMaxWidth = 400.0;
              final _topPadding = constraints.maxHeight * 0.05;
              final _buttonWidth = constraints.maxWidth < _buttonMaxWidth
                  ? constraints.maxWidth * 0.9
                  : _buttonMaxWidth * 0.9;

              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: _topPadding),
                    child: LoginHeaderImager(),
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
