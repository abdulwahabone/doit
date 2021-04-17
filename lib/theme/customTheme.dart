import 'package:flutter/material.dart';

import 'colors.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: CustomColors.backGround,
      scaffoldBackgroundColor: CustomColors.backGround,
      backgroundColor: CustomColors.backGround,
    );
  }
}
