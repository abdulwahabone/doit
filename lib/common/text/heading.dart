import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:doit/theme/colors.dart';

class Heading extends StatelessWidget {
  final String text;
  final Color color;

  const Heading({
    Key? key,
    required this.text,
    this.color = CustomColors.headingColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 20),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: constraints.maxWidth,
              ),
              child: AutoSizeText(
                text,
                style: TextStyle(
                  fontSize: 37,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
                minFontSize: 20,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
              ),
            );
          },
        ),
      ),
    );
  }
}
