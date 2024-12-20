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
