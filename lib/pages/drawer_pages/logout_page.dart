import 'package:firebase_practice/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/controllers/simple_hidden_drawer_controller.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        onDrawerIconPressed: () {
          SimpleHiddenDrawerController.of(context).toggle();
        },
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.onTertiary,
            title: const Text('Logout'),
            content: const Text('Are you sure you want to logout?'),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary),
                onPressed: () {},
                child: const Text('Ok'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
