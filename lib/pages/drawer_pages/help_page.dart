import 'package:firebase_practice/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/controllers/simple_hidden_drawer_controller.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: MyAppBar(
        pageTitle: 'Help',
        onDrawerIconPressed: () {
          SimpleHiddenDrawerController.of(context).toggle();
        },
        backgroundColorAppBar:
            Colors.transparent, // Optional, you can customize the color here
      ),
      body: ListView(
        children: [
          const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          "Welcome to the Help Page! Find solutions to your queries below.",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      const ExpansionTile(
        title: Text("Getting Started"),
        children: [
          ListTile(title: Text("How to connect your device")),
          ListTile(title: Text("Setting up your account")),
        ],
      ),
      const ExpansionTile(
        title: Text("Troubleshooting"),
        children: [
          ListTile(title: Text("Why can't I connect to Wi-Fi?")),
          ListTile(title: Text("Device not responding")),
        ],
      ),
      const ExpansionTile(
        title: Text("FAQs"),
        children: [
          ListTile(title: Text("How do I reset my password?")),
          ListTile(title: Text("How do I add a new device?")),
        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        child: ElevatedButton(
          onPressed: () {
            // Navigate to support page or open chat
          },
          child: const Text("Contact Support"),
        ),
      ),
        ],
      ),
    );
  }
}