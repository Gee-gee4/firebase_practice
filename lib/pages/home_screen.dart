import 'package:firebase_practice/widgets/reusable_widgets.dart';
import 'package:firebase_practice/widgets/rooms_cards.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.menu,color: Colors.brown,),
      ),
      //backgroundColor: Colors.pink[100],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '27°',
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
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
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.add_circle,
                      size: 35,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Column(
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
                color: Colors.white,
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
                      icon: const Icon(
                        Icons.add_circle,
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'All Rooms',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios,
                ),
              ),
            ],
          ),
          Expanded(
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
