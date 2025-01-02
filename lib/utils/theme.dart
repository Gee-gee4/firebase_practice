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
    inversePrimary: Colors.white
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: false,
  colorScheme: ColorScheme.dark(
    surface: hexStringToColor('2B2927'),
    // 4E3D37
    primary: hexStringToColor('424242'),
    // 987654
    secondary: hexStringToColor('A67C52'),
    onTertiary: hexStringToColor('424242'),
    inversePrimary: Colors.white70
  ),
);


/*
Colors.grey[900]: #212121 
Colors.grey[600]: #757575
Colors.grey[700]: #616161
Colors.grey[800]: #424242
Colors.grey[850]: #303030
*/