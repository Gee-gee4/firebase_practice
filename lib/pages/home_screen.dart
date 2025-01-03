import 'package:firebase_practice/my_app_bar.dart';
import 'package:firebase_practice/utils/color_hex.dart';
import 'package:firebase_practice/widgets/reusable_widgets.dart';
import 'package:firebase_practice/widgets/rooms_cards.dart';
import 'package:firebase_practice/widgets/switch.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/controllers/simple_hidden_drawer_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController =
      ScrollController(); // Define the controller here
  @override
  void dispose() {
    _scrollController.dispose(); // Clean up the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: hexStringToColor('f2e5d9'),
      backgroundColor: Theme.of(context).colorScheme.surface,
      //  const DrawerContent(),
      appBar: MyAppBar(
        onDrawerIconPressed: () {
          SimpleHiddenDrawerController.of(context).toggle();
        },
        backgroundColorAppBar:
            Colors.transparent, // Optional, you can customize the color here
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '70°F',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2), // Shadow color
                        spreadRadius: 2, // How wide the shadow spreads
                        blurRadius: 2, // The blur effect of the shadow
                        offset: const Offset(
                            0, 3), // Positioning of the shadow (x, y)
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SwitchButton(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi Gee',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Welcome to your Smart Home',
                  style: TextStyle(fontSize: 16, color: Colors.brown),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 70,
              width: 300,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2), // Shadow color
                    spreadRadius: 2, // How wide the shadow spreads
                    blurRadius: 2, // The blur effect of the shadow
                    offset:
                        const Offset(0, 3), // Positioning of the shadow (x, y)
                  ),
                ],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    myCircleAvatar('assets1/auth/one.jpeg'),
                    const SizedBox(
                      width: 10,
                    ),
                    myCircleAvatar('assets1/auth/two.jpeg'),
                    const SizedBox(
                      width: 10,
                    ),
                    myCircleAvatar('assets1/auth/three.jpeg'),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_circle,
                        size: 35,
                        color: hexStringToColor('8d765b').withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'All Rooms',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {
                    _scrollController.animateTo(
                      _scrollController.position.maxScrollExtent,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeOut,
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                RoomsCards(scrollController: _scrollController),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
