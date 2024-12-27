import 'package:firebase_practice/widgets/switch.dart';
import 'package:firebase_practice/utils/color_hex.dart';
import 'package:flutter/material.dart';
import 'package:firebase_practice/model/room_model.dart';

class DescriptionPage extends StatelessWidget {
  
  final AllRoomModel describeRoom; // Accept a room object

   const DescriptionPage({super.key, required this.describeRoom});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(''), // Display the room's title
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(20.0),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings),
            ),
          ),
        ],
        elevation: 0,
      ),
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            child: Image.asset(
              describeRoom.imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 450,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                color: hexStringToColor('a18167').withOpacity(0.5),
              ),
              child:  Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                        describeRoom.title,
                          style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                        ),
                        const SwitchButton(),
                      ],
                    ),
                    Text(describeRoom.descripion,
                    style:const TextStyle(color: Colors.white,fontSize: 17) ,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
