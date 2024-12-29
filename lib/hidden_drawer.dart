import 'package:firebase_practice/pages/drawer_pages/account_page.dart';
import 'package:firebase_practice/pages/home_screen.dart';
import 'package:firebase_practice/utils/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:provider/provider.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  late List<ScreenHiddenDrawer> _pages = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Initialize pages in didChangeDependencies to ensure Theme.of(context) works

    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'HomeScreen',
          baseStyle: const TextStyle(),
          selectedStyle: const TextStyle(),
          colorLineSelected: Theme.of(context).colorScheme.surface,
          
        ),
        Theme(
          data: Provider.of<ThemeProvider>(context).themeData,
          child: const HomeScreen(),
        ),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'AccountPage',
          baseStyle: const TextStyle(),
          selectedStyle: const TextStyle(),
          colorLineSelected: Theme.of(context).colorScheme.secondary,
        ),
        Theme(
          data: Provider.of<ThemeProvider>(context).themeData,
          child: const AccountPage(),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Theme.of(context).colorScheme.onTertiary,
      screens: _pages,
      initPositionSelected: 0,
      disableAppBarDefault: true,
      tittleAppBar: null, // Custom title logic if required
      isDraggable: true,
      slidePercent: 50,
      contentCornerRadius: 20,
    );
  }
}
