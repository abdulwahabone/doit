import 'package:doit/theme/colors.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:doit/common/fields/fieldContainer.dart';

class InputField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final Color iconColor;
  final bool isPasswordField;
  final bool isEmail;

  const InputField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.controller,
    this.isPasswordField = false,
    this.isEmail = false,
    this.iconColor = CustomColors.accentColor,
  }) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late bool _obscureText;
  void obscureText(bool value) => setState(() => _obscureText = value);

  @override
  void initState() {
    _obscureText = widget.isPasswordField;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget suffixIcon = GestureDetector(
      onTap: () => setState(() => _obscureText = !_obscureText),
      child: Icon(
        _obscureText ? Icons.visibility : Icons.visibility_off,
        semanticLabel: _obscureText ? 'show password' : 'hide password',
        color: widget.iconColor,
      ),
    );

    return TextFieldContainer(
      child: TextFormField(
        autovalidateMode: AutovalidateMode.disabled,
        autocorrect: false,
        obscureText: _obscureText,
        cursorColor: widget.iconColor,
        controller: widget.controller,
        decoration: InputDecoration(
          icon: Icon(
            widget.icon,
            color: widget.iconColor,
          ),
          hintText: widget.hintText,
          suffixIcon: widget.isPasswordField ? suffixIcon : null,
          border: InputBorder.none,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          if (widget.isEmail) {
            final bool isValid = EmailValidator.validate(value);
            if (!isValid) return 'Invalid Email';
          }
          return null;
        },
      ),
    );
  }
}
