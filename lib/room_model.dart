final List<AllRoomModel> allRoomList = [
  AllRoomModel(title: 'Living Room', imagePath: 'assets/auth/livingroom.jpeg'),
  AllRoomModel(title: 'Kitchen', imagePath: 'assets/auth/kitchen.jpeg'),
  AllRoomModel(title: 'Dining Room', imagePath: 'assets/auth/diningroom.jpeg'),
  AllRoomModel(title: 'Home Office', imagePath: 'assets/auth/homeoffice.jpeg'),
  AllRoomModel(title: 'Master Bedroom', imagePath: 'assets/auth/masterbedroom.jpeg'),
];


class AllRoomModel {
  AllRoomModel({
required this.title,
required this.imagePath,
  });

  String title;
  String imagePath;
}
