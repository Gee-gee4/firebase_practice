// hidden_drawer_pages.dart

import 'package:firebase_practice/pages/drawer_pages/account_page.dart';
import 'package:firebase_practice/pages/drawer_pages/devices_page.dart';
import 'package:firebase_practice/pages/drawer_pages/help_page.dart';
import 'package:firebase_practice/pages/drawer_pages/manage_users_page.dart';
import 'package:firebase_practice/pages/drawer_pages/music_page.dart';
import 'package:firebase_practice/pages/drawer_pages/rooms_page.dart';
import 'package:firebase_practice/pages/drawer_pages/settings_page.dart';
import 'package:firebase_practice/pages/home_screen.dart';
import 'package:firebase_practice/utils/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:provider/provider.dart';

List<ScreenHiddenDrawer> getDrawerPages(BuildContext context) {
  return [
    ScreenHiddenDrawer(
      ItemHiddenMenu(
        name: 'Home',
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
        name: 'My Account',
        baseStyle: const TextStyle(),
        selectedStyle: const TextStyle(),
        colorLineSelected: Theme.of(context).colorScheme.surface,
      ),
      Theme(
        data: Provider.of<ThemeProvider>(context).themeData,
        child: const AccountPage(),
      ),
    ),
    ScreenHiddenDrawer(
      ItemHiddenMenu(
        name: 'Manage Users',
        baseStyle: const TextStyle(),
        selectedStyle: const TextStyle(),
        colorLineSelected: Theme.of(context).colorScheme.surface,
      ),
      Theme(
        data: Provider.of<ThemeProvider>(context).themeData,
        child: const ManageUsersPage(),
      ),
    ),
    ScreenHiddenDrawer(
      ItemHiddenMenu(
        name: 'Devices',
        baseStyle: const TextStyle(),
        selectedStyle: const TextStyle(),
        colorLineSelected: Theme.of(context).colorScheme.surface,
      ),
      Theme(
        data: Provider.of<ThemeProvider>(context).themeData,
        child: const DevicesPage(),
      ),
    ),
    ScreenHiddenDrawer(
      ItemHiddenMenu(
        name: 'Rooms',
        baseStyle: const TextStyle(),
        selectedStyle: const TextStyle(),
        colorLineSelected: Theme.of(context).colorScheme.surface,
      ),
      Theme(
        data: Provider.of<ThemeProvider>(context).themeData,
        child: const RoomsPage(),
      ),
    ),
    ScreenHiddenDrawer(
      ItemHiddenMenu(
        name: 'Music',
        baseStyle: const TextStyle(),
        selectedStyle: const TextStyle(),
        colorLineSelected: Theme.of(context).colorScheme.surface,
      ),
      Theme(
        data: Provider.of<ThemeProvider>(context).themeData,
        child: const MusicPage(),
      ),
    ),
    ScreenHiddenDrawer(
      ItemHiddenMenu(
        name: 'Settings',
        baseStyle: const TextStyle(),
        selectedStyle: const TextStyle(),
        colorLineSelected: Theme.of(context).colorScheme.surface,
      ),
      Theme(
        data: Provider.of<ThemeProvider>(context).themeData,
        child: const SettingsPage(),
      ),
    ),
    ScreenHiddenDrawer(
      ItemHiddenMenu(
        name: 'Help',
        baseStyle: const TextStyle(),
        selectedStyle: const TextStyle(),
        colorLineSelected: Theme.of(context).colorScheme.surface,
      ),
      Theme(
        data: Provider.of<ThemeProvider>(context).themeData,
        child: const HelpPage(),
      ),
    ),
    ScreenHiddenDrawer(
      ItemHiddenMenu(
        name: 'Logout',
        baseStyle: const TextStyle(),
        selectedStyle: const TextStyle(),
        colorLineSelected: Theme.of(context).colorScheme.surface,
      ),
      Theme(
        data: Provider.of<ThemeProvider>(context).themeData,
        child: AboutDialog(),
      ),
    ),
  ];
}
