import 'package:firebase_practice/widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';

class DrawerContent extends StatelessWidget {
  const DrawerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.85,
      child: Drawer(
        backgroundColor:  Theme.of(context).colorScheme.onTertiary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        width: MediaQuery.of(context).size.width * 0.75,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: const CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('assets/auth/one.jpeg'),
                ),
                title: const Center(
                  child: Text(
                    'Hi Gee',
                    style: TextStyle(
                        //color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                ),
                subtitle: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    // padding: EdgeInsets.zero,
                  ),
                  child:  Text('Edit Profile',style: TextStyle(color: Colors.grey[700]),),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Divider(
                color: Colors.white70,
              ),
              myListTile(const Icon(Icons.manage_accounts), 'Manage Users', () {}),
              myListTile(const Icon(Icons.devices), 'Devices', () {}),
              myListTile(const Icon(Icons.room), 'Rooms', () {}),
              myListTile(const Icon(Icons.music_note), 'Music', () {}),
              myListTile(const Icon(Icons.settings), 'Settings', () {}),
              myListTile(const Icon(Icons.help), 'Help', () {}),
              Spacer(flex: 1,),
              myListTile(const Icon(Icons.power_settings_new), 'Logout', () {}),
            ],
          ),
        ),
      ),
    );
  }
}
