import 'package:firebase_practice/widgets/devices.dart';
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
            icon:  Icon(Icons.arrow_back_ios_new_outlined,color: Theme.of(context).colorScheme.secondary,),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: IconButton(
              onPressed: () {},
              icon:  Icon(Icons.settings,color: Theme.of(context).colorScheme.secondary),
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
              height: 500,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                color: Theme.of(context).colorScheme.onTertiary.withOpacity(0.5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          describeRoom.title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                        Icon(
                        Icons.location_on,
                        size: 35,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      ],
                    ),
                    Text(
                      describeRoom.descripion,
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 17),
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      describeRoom.temperature,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8,),
                    const Divider(
                      color: Colors.white70,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Devices',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                          ),
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Devices(
                            iconDevice: Icon(Icons.wifi, color: Colors.brown),
                            device: 'WiFi',
                            deviceStatus: 'On'),
                        const Devices(
                            iconDevice: Icon(Icons.lightbulb_outline,
                                color: Colors.brown),
                            device: 'Light',
                            deviceStatus: 'On'),
                        Devices(
                            iconDevice: const Icon(Icons.thermostat_outlined,
                                color: Colors.brown),
                            device: 'Temp',
                            deviceStatus: describeRoom.temperature),
                        const Devices(
                            iconDevice: Icon(
                              Icons.wind_power_outlined,
                              color: Colors.brown,
                            ),
                            device: 'Fan',
                            deviceStatus: 'On')
                      ],
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
