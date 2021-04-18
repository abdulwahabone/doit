import 'package:doit/common/buttons/roundedButton.dart';
import 'package:doit/common/snackBar/appSnackBar.dart';
import 'package:doit/provider/LoginProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:doit/common/fields/InputField.dart';
import 'package:doit/common/lottie/loginHeaderImage.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  Future<void> _submit() async {
    bool validate = _formKey.currentState!.validate();
    if (validate) {
      await Provider.of<LoginProvider>(context, listen: false)
          .signIn(emailController.text, passwordController.text)
          .catchError(
            (e) => AppSnackBar().showSnackBar(context, e),
          );
    }
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

              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: _topPadding),
                      child: LoginHeaderImager(),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          InputField(
                            hintText: 'Your Email',
                            controller: emailController,
                            icon: Icons.person,
                            isEmail: true,
                          ),
                          InputField(
                            hintText: 'Your Password',
                            isPasswordField: true,
                            controller: passwordController,
                            icon: Icons.lock,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: RoundedButton(
                        text: 'LOGIN',
                        onPressed: () => _submit(),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
