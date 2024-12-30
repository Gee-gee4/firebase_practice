import 'package:firebase_practice/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/controllers/simple_hidden_drawer_controller.dart';

class DevicesPage extends StatelessWidget {
  const DevicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: MyAppBar(
        pageTitle: 'Devices',
        onDrawerIconPressed: () {
          SimpleHiddenDrawerController.of(context).toggle();
        },
        backgroundColorAppBar:
            Colors.transparent, // Optional, you can customize the color here
      ),
    );
  }
}