import 'package:firebase_practice/utils/color_hex.dart';
import 'package:firebase_practice/widgets/reusable_widgets.dart';
import 'package:firebase_practice/widgets/rooms_cards.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: hexStringToColor('dbc2ad'),
        
      ),
      backgroundColor: hexStringToColor('F2E5D9'),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading: const Icon(
        //   Icons.menu,
        //   color: Colors.brown,
        // ),
      ),
      //backgroundColor: Colors.pink[100],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '27°',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Shadow color
                        spreadRadius: 2, // How wide the shadow spreads
                        blurRadius: 5, // The blur effect of the shadow
                        offset: const Offset(
                            0, 3), // Positioning of the shadow (x, y)
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
                    color: hexStringToColor('e9d3c0'),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.add_circle,
                        size: 35,
                        color: hexStringToColor('8d765b'),
                      ),
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
                  'Hi Moana',
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
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 2, // How wide the shadow spreads
                    blurRadius: 5, // The blur effect of the shadow
                    offset:
                        const Offset(0, 3), // Positioning of the shadow (x, y)
                  ),
                ],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
                color: hexStringToColor('e9d3c0'),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    myCircleAvatar('assets/auth/one.jpeg'),
                    const SizedBox(
                      width: 10,
                    ),
                    myCircleAvatar('assets/auth/two.jpeg'),
                    const SizedBox(
                      width: 10,
                    ),
                    myCircleAvatar('assets/auth/three.jpeg'),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_circle,
                        size: 35,
                        color: hexStringToColor('d1b7a1'),
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
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: Column(
              children: [
                RoomsCards(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
