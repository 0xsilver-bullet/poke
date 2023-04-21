import 'package:flutter/material.dart';

abstract class PokeAppColors {
  static const darkGrey = Color(0xFF1F1F1F);
}

abstract class PokeAppTheme {
  static final ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: PokeAppColors.darkGrey,
    appBarTheme: const AppBarTheme(
      backgroundColor: PokeAppColors.darkGrey,
      elevation: 0,
    ),
  );
}
