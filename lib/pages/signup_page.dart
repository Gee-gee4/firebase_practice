import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/pages/home_screen.dart';
import 'package:firebase_practice/utils/color_hex.dart';
import 'package:firebase_practice/widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _userNameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _confirmpasswordTextController =
      TextEditingController();

  void signUpUser() {
    //show loading circle

    //make sure passwords match

    //try create the user
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Sign Up'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              hexStringToColor('BB73E0'),
              hexStringToColor('FF8DDB'),
              //  hexStringToColor('A9AACE'),
              // hexStringToColor('C3C4FF'),
              //hexStringToColor('1C0125'),
              // hexStringToColor('A0A8F3'),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 20),
            child: Column(
              children: [
                reusableTextField('Enter Username', Icons.person_outline, false,
                    _userNameTextController),
                const SizedBox(
                  height: 20.0,
                ),
                reusableTextField('Enter Email Id', Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20.0,
                ),
                reusableTextField('Enter Password', Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20.0,
                ),
                reusableTextField('Confirm Password', Icons.lock_outline, true,
                    _confirmpasswordTextController),
                const SizedBox(
                  height: 20.0,
                ),
                  signInSinUpButton(
                    context,
                    false,
                    () {
                      if (_passwordTextController.text !=
                          _confirmpasswordTextController.text) {
                        showDialog(
                            context: context,
                            builder: (context) => const AlertDialog(
                                  title: Text('Passwords don\'t match!'),
                                ));
                      } else {
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: _emailTextController.text,
                                password: _passwordTextController.text)
                            .then((value) {
                          // ignore: avoid_print
                          print('Created New Account!!');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        }).onError(
                          (error, stackTrace) {
                            // ignore: avoid_print
                            print('Error ${error.toString()}');
                          },
                        );
                      }
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
