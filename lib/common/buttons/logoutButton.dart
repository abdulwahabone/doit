import 'package:flutter/material.dart';

import 'package:doit/theme/colors.dart';

class LogoutButton extends StatelessWidget {
  final Function onPressed;
  final Color color;

  const LogoutButton({
    Key? key,
    required this.onPressed,
    this.color = CustomColors.accentColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        child: Icon(
          Icons.logout,
          size: 40,
          color: CustomColors.accentColor,
        ),
        onTap: () => onPressed(),
      ),
    );
  }
}
