import 'package:firebase_practice/utils/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SwitchButton extends StatefulWidget {
  const SwitchButton({super.key});

  @override
  State<SwitchButton> createState() => _SwitchState();
}

class _SwitchState extends State<SwitchButton> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    // final bool darkMode =  Theme.of(context).brightness == Brightness.dark;
    //   final activeColor = darkMode ? hexStringToColor('110703') : hexStringToColor('8d765b');
    return Switch(
      value: isSwitched,
      onChanged: (value) {
        setState(() {
          isSwitched = value;
          Provider.of<ThemeProvider>(context ,listen: false).toggleTheme();
        });
      },
      // activeColor: activeColor
    );
  }
}
