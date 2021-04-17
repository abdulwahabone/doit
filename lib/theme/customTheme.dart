import 'package:flutter/material.dart';

import 'colors.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: CustomColors.backGround,
      accentColor: CustomColors.accentColor,
      scaffoldBackgroundColor: CustomColors.backGround,
      backgroundColor: CustomColors.backGround,
    );
  }
}
