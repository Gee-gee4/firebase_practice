import 'package:firebase_practice/hidden_drawer_pages.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

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

    // Initialize pages in didChangeDependencies to ensure Theme.of(context) works
    _pages = getDrawerPages(context); // Retrieve the pages from the new file
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
