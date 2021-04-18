import 'package:flutter/material.dart';

import 'package:doit/theme/colors.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final Function onPressed;
  final Color color;

  const CustomFloatingActionButton({
    Key? key,
    required this.onPressed,
    this.color = CustomColors.greyIconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: 80.0,
      child: FittedBox(
        child: FloatingActionButton(
          child: Icon(
            Icons.playlist_add,
            size: 30,
          ),
          backgroundColor: CustomColors.accentColor,
          onPressed: () => onPressed(),
        ),
      ),
    );
  }
}
