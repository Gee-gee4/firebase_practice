import 'package:firebase_practice/room_model.dart';
import 'package:flutter/material.dart';

class RoomsCards extends StatelessWidget {
  const RoomsCards({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: allRoomList.length,
          itemBuilder: (context, index) {
            // Get the current room from the list
            final room = allRoomList[index];
            return Container(
              //padding: EdgeInsets.all(8),
              margin: const EdgeInsets.only(left: 10, right: 2),
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                //color: Colors.brown,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    Image.asset(
                      room.imagePath,
                      height: 300,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                    Center(
                      child: Text(
                        room.title,
                        style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
