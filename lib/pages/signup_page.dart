import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/hidden_drawer.dart';
import 'package:firebase_practice/utils/color_hex.dart';
import 'package:firebase_practice/widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // final TextEditingController _userNameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _confirmpasswordTextController =
      TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  bool showPassword = false;
  bool showConfirmPassword = false;

  Future addUserDetails(
      String firstName, String lastName, String email, int age) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstName,
      'last name': lastName,
      'email': email,
      'age': age,
    });
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
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.15, 20, 20),
            child: Column(
              children: [
                //first name
                reusableTextField('First Name', Icons.person_outline, true,
                    _firstNameController),
                const SizedBox(
                  height: 20.0,
                ),
                //last name
                reusableTextField('Last Name', Icons.person_outline, true,
                    _lastNameController),
                const SizedBox(
                  height: 20.0,
                ),
                //age
                reusableTextField(
                    'Age', Icons.person_outline, true, _ageController),
                const SizedBox(
                  height: 20.0,
                ),
                // //Username
                // reusableTextField('Enter Username', Icons.person_outline, true,
                //     _userNameTextController),
                // const SizedBox(
                //   height: 20.0,
                // ),
                //email
                reusableTextField('Email Id', Icons.person_outline, true,
                    _emailTextController),
                const SizedBox(
                  height: 20.0,
                ),
                //password
                reusableTextField(
                  'Password',
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
                  height: 20.0,
                ),
                //confirm password
                reusableTextField(
                  'Confirm Password',
                  Icons.lock_outline,
                  showConfirmPassword,
                  _confirmpasswordTextController,
                  toggleOnOff: () {
                    setState(() {
                      showConfirmPassword = !showConfirmPassword;
                    });
                  },
                ),
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
                        ),
                      );
                    } else {
                      //create user
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: _emailTextController.text,
                              password: _passwordTextController.text)
                          .then((value) {
                        //add user details to firebase
                        addUserDetails(
                          _firstNameController.text.trim(),
                          _lastNameController.text.trim(),
                          _emailTextController.text.trim(),
                          int.parse(_ageController.text.trim()),
                        );
                        // ignore: avoid_print
                        // Navigate to Hiddendrawer()
                        print('Created New Account!!');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HiddenDrawer(),
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

// E R R O R
/* 
ive not changed anything in my code this is the error 
I/FirebaseAuth( 3816): Creating user with get2@gmail.com with empty reCAPTCHA token
W/System ( 3816): Ignoring header X-Firebase-Locale because its value was null.
I/System.out( 3816): [okhttp]:check permission begin!
I/System.out( 3816): [okhttp]:not MMS!
I/System.out( 3816): [okhttp]:not Email!
I/System.out( 3816): [OkHttp] sendRequest
W/System ( 3816): Ignoring header X-Firebase-Locale because its value was null.
I/System.out( 3816): [okhttp]:check permission begin!
I/System.out( 3816): [okhttp]:not MMS!
I/System.out( 3816): [okhttp]:not Email!
I/System.out( 3816): [OkHttp] sendRequest
D/FirebaseAuth( 3816): Notifying id token listeners about user ( iFie91niwWPh1V6kZl5Sm1XdfIi1 ).
D/FirebaseAuth( 3816): Notifying auth state listeners about user ( iFie91niwWPh1V6kZl5Sm1XdfIi1 ).
I/flutter ( 3816): Error type 'List<Object?>' is not a subtype of type 'PigeonUserDetails?' in type cast 
*/