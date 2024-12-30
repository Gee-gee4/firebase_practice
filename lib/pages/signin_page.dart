import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/hidden_drawer.dart';
import 'package:firebase_practice/pages/signup_page.dart';
import 'package:firebase_practice/utils/color_hex.dart';
import 'package:firebase_practice/widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  

  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    Row signUpOption() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Dont have an account?',
            style: TextStyle(color: Colors.white70),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUpPage(),
                ),
              );
            },
            child: const Text(
              ' Sign Up',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      );
    }
    return Scaffold(
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
              // hexStringToColor('FFDDEC'),
              // hexStringToColor('FFA4ED'),
              // hexStringToColor('FFDDEC'),
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
                  logoAuth('assets/auth/eyes.png'),
                  reusableTextField('Enter Username', Icons.person_outline,
                      true, _emailTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField(
                    'Enter Password',
                    Icons.lock_outline,
                    showPassword,
                    _passwordTextController,
                    toggleOnOff: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  signInSinUpButton(
                    context,
                    true,
                    () {
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: _emailTextController.text,
                              password: _passwordTextController.text)
                          .then((value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HiddenDrawer(),
                          ),
                        );
                      }).onError((error, stackTrace) {
                        print('Error ${error.toString()}');
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  signUpOption()
                ],
              )),
        ),
      ),
    );
  }
}
