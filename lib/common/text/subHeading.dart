import 'package:flutter/material.dart';

import 'package:doit/theme/colors.dart';

class SubHeading extends StatelessWidget {
  final String text;
  final Color color;

  const SubHeading({
    Key? key,
    required this.text,
    this.color = CustomColors.subHeadingColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 20),
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
