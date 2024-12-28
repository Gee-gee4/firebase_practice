import 'package:firebase_practice/utils/color_hex.dart';
import 'package:flutter/material.dart';

class Devices extends StatelessWidget {
  final Icon iconDevice;
  final String device;
  final String deviceStatus;
  const Devices(
      {super.key,
      required this.iconDevice,
      required this.device,
      required this.deviceStatus});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(35),
        ),
        color: hexStringToColor('e9d3c0').withOpacity(0.4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: iconDevice,
          ),
          Text(
            device,
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),
          ),
          Text(deviceStatus,style: TextStyle(color: Colors.white54),),
        ],
      ),
    );
  }
}
