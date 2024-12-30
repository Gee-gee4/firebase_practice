import 'package:firebase_practice/model/room_model.dart';
import 'package:firebase_practice/widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';

class RoomsCards extends StatelessWidget {
  final ScrollController scrollController;

  const RoomsCards({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
          controller: scrollController, // Using the passed controller
          scrollDirection: Axis.horizontal,
          itemCount: allRoomList.length,
          itemBuilder: (context, index) {
            // Get the current room from the list
            return myRoomContainer(context, index);
          }),
    );
  }
}
