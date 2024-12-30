import 'package:firebase_practice/model/room_model.dart';
import 'package:firebase_practice/pages/description_page.dart';
import 'package:flutter/material.dart';

Image logoAuth(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 240,
    //color: Colors.black,
  );
}

//........................................................................................

TextField reusableTextField(
    String text, IconData icon, bool showText, TextEditingController controller,
    {Function()? toggleOnOff}) {
  return TextField(
    controller: controller,
    obscureText: !showText,
    enableSuggestions: showText,
    cursorColor: Colors.white,
    style: TextStyle(
      color: Colors.white.withOpacity(0.9),
    ),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white,
      ),
      labelText: text,
      labelStyle: TextStyle(
        color: Colors.white.withOpacity(0.9),
      ),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
      ),
      suffixIcon: toggleOnOff == null
          ? null
          : IconButton(
              onPressed: toggleOnOff,
              icon: Icon(showText ? Icons.visibility_off : Icons.visibility),
            ),
    ),
    keyboardType:
        !showText ? TextInputType.visiblePassword : TextInputType.emailAddress,
  );
}

//........................................................................................

Container signInSinUpButton(
    BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(90),
    ),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          },
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      child: Text(
        isLogin ? 'LOG IN' : 'SIGN UP',
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
    ),
  );
}

//........................................................................................
CircleAvatar myCircleAvatar(String myImage) {
  return CircleAvatar(
    radius: 25,
    backgroundImage: AssetImage(myImage),
  );
}

//........................................................................................

ListTile myListTile(Icon myIcon, String myDrawerText, Function()? onTap) {
  return ListTile(
    leading: myIcon,
    title: Text(myDrawerText),
  );
}

//........................................................................................

Container myRoomContainer(BuildContext context, index) {
  final room = allRoomList[index];
  return Container(
    //padding: EdgeInsets.all(8),
    margin: const EdgeInsets.only(
      left: 10,
      right: 2,
    ),
    width: 150,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      //color: Colors.brown,
    ),
    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DescriptionPage(describeRoom: room),
          ),
        );
      },
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
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
