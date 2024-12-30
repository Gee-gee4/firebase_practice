import 'package:firebase_practice/model/room_model.dart';
import 'package:firebase_practice/my_app_bar.dart';
import 'package:firebase_practice/widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/controllers/simple_hidden_drawer_controller.dart';

class RoomsPage extends StatelessWidget {
  // final AllRoomModel availableRooms; //the properties of each room
  const RoomsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: MyAppBar(
        pageTitle: 'Rooms',
        onDrawerIconPressed: () {
          SimpleHiddenDrawerController.of(context).toggle();
        },
        backgroundColorAppBar:
            Colors.transparent, // Optional, you can customize the color here
        // actions: [
        //   IconButton(
        //       onPressed: () {},
        //       icon: const Icon(Icons.add_circle),
        //       color: hexStringToColor('8d765b').withOpacity(0.6)),
        // ],
      ),
      body: GridView.builder(
        itemCount: allRoomList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
          mainAxisSpacing: 10.0, // Space between rows
          crossAxisSpacing: 0.0, // Space between columns
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: myRoomContainer(context, index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
