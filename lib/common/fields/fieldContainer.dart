import 'package:flutter/material.dart';

import 'package:doit/theme/colors.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  final Color fieldBackgroundColor;

  const TextFieldContainer(
      {Key? key,
      required this.child,
      this.fieldBackgroundColor = CustomColors.accentColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: fieldBackgroundColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
