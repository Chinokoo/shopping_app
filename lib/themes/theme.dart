import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    colorScheme: ColorScheme.light(
  surface: Colors.grey.shade300,
  primary: Colors.grey.shade200,
  secondary: Colors.white,
  inversePrimary: Colors.grey.shade700,
));

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      surface: Colors.grey.shade900,
      primary: Colors.grey.shade800,
      secondary: Colors.black,
      inversePrimary: Colors.grey.shade400,
    ));
