final List<AllRoomModel> allRoomList = [
  AllRoomModel(title: 'Living Room', imagePath: 'assets/auth/livingroom.jpeg',descripion: 'Your living room features 4 smart devices: a smart TV, voice-activated speaker, ambient lighting, and a thermostat. Currently, 3 users have access to control these devices. Upgrades available: Motion-detection lighting and a smart entertainment hub. The room is set to a comfortable temperature of 72°F, automatically adjusted based on occupancy.'),
  AllRoomModel(title: 'Kitchen', imagePath: 'assets/auth/kitchen.jpeg',descripion: 'The kitchen includes 5 smart devices: a Wi-Fi-enabled fridge, automated coffee maker, smart oven, voice-controlled assistant, and motion-sensor lighting. Access is shared by 2 users. Upgrades needed: Smart faucets and pantry monitoring. Temperature is maintained at 70°F to ensure optimal comfort while cooking.'),
  AllRoomModel(title: 'Dining Room', imagePath: 'assets/auth/diningroom.jpeg',descripion: 'Outfitted with 3 smart devices: adjustable smart lighting, a voice-activated assistant, and a smart speaker for music. 4 users can control these features. Recommended upgrade: Smart blinds for enhanced ambiance. The temperature is optimized at 71°F for dining comfort.'),
  AllRoomModel(title: 'Home Office', imagePath: 'assets/auth/homeoffice.jpeg',descripion: 'Your home office boasts 4 smart devices: noise-canceling smart speakers, an adjustable desk light, a smart thermostat, and a connected monitor. 1 primary user manages these devices. Upgrade suggestions: Smart air purifier and energy-efficient plugs. Temperature is set to 70°F for focus and productivity.'),
  AllRoomModel(title: 'Master Bedroom', imagePath: 'assets/auth/masterbedroom.jpeg',descripion: 'The master bedroom includes 6 smart devices: automated blinds, color-changing lights, a voice-activated assistant, a smart alarm clock, a thermostat, and a smart air purifier. 2 users currently have access. Upgrade options: Sleep trackers and smart mattress integration. The temperature is maintained at 68°F, ideal for restful sleep.'),
];

class AllRoomModel {
  AllRoomModel({
    required this.title,
    required this.imagePath,
    required this.descripion,
  });

  String title;
  String imagePath;
  String descripion;
}
