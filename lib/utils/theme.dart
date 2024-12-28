import 'package:firebase_practice/utils/color_hex.dart';
import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  useMaterial3: false,
  colorScheme: ColorScheme.light(
    surface: hexStringToColor('f2e5d9'),
    primary: hexStringToColor('e9d3c0'),
    secondary: hexStringToColor('8d765b'),
    onTertiary: hexStringToColor('a18167'),
    errorContainer: Colors.black
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: false,
  colorScheme: ColorScheme.dark(
    surface: hexStringToColor('4E3D37 '),
    primary: hexStringToColor('987654 '),
    secondary: hexStringToColor('A67C52'),
    onTertiary: hexStringToColor('2B2927'),
  ),
);
