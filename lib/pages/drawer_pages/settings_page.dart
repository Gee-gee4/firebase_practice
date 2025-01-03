import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/my_app_bar.dart';
import 'package:firebase_practice/pages/drawer_pages/account_page.dart';
import 'package:firebase_practice/pages/drawer_pages/manage_users_page.dart';
import 'package:firebase_practice/pages/signin_page.dart';
import 'package:firebase_practice/widgets/neu_box.dart';
import 'package:firebase_practice/widgets/switch.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/controllers/simple_hidden_drawer_controller.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isOn = false;

  // Function to log the user out and navigate to SignInPage
  void _logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut(); // Sign out the user
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const SignInPage()), // Navigate to SignInPage
      );
    } catch (e) {
      // ignore: avoid_print
      print("Error logging out: $e");
    }
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.surface,
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.onTertiary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              onPressed: () {
                _logout(context); // Log out and navigate to SignInPage
              },
              child: Text(
                'Ok',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.onTertiary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: MyAppBar(
        pageTitle: 'Settings',
        onDrawerIconPressed: () {
          SimpleHiddenDrawerController.of(context).toggle();
        },
        backgroundColorAppBar:
            Colors.transparent, // Optional, you can customize the color here
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Icon(Icons.dark_mode_outlined),
            title: Text('Dark Mode'),
            trailing: SwitchButton(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Accounts',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person_outline),
            title: Text('Edit Profile'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AccountPage(),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.people_outline),
            title: Text('Manage Accounts'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ManageUsersPage(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Notifications',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.notifications_none_outlined),
            title: Text('Notifications'),
            trailing: Switch(
              value: isOn,
              onChanged: (value) {
                setState(() {
                  // isOn;
                  isOn = !isOn;
                });
              },
              activeColor: Colors.green,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Regional',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'),
            subtitle: Text('English'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            // tileColor: Colors.pink,
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: _showDialog,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Feedback',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
            ),
          ),
          ListTile(
            // tileColor: Colors.pink,
            leading: Icon(Icons.report_problem_outlined),
            title: Text('Report a bug'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            // tileColor: Colors.pink,
            leading: Icon(Icons.send),
            title: Text('Senf feedback'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
