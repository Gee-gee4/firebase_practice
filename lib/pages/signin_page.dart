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
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    Row signUpOption() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Don't have an account?",
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
              // Theme.of(context).colorScheme.secondary,
              // Theme.of(context).colorScheme.onTertiary,
              // Theme.of(context).colorScheme.primary,
              hexStringToColor('BB73E0'),
              hexStringToColor('FF8DDB'),
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
                      //loading Circle
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Center(
                              child: CircularProgressIndicator(
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                            );
                          });
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: _emailTextController.text,
                              password: _passwordTextController.text)
                          .then((value) {
                        Navigator.push(
                          // ignore: use_build_context_synchronously
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HiddenDrawer(),
                          ),
                        );
                      }).onError((error, stackTrace) {
                        // ignore: avoid_print
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
 /*The overflowing RenderFlex has an orientation of Axis.vertical.
The edge of the RenderFlex that is overflowing has been marked in the rendering with a yellow and
black striped pattern. This is usually caused by the contents being too big for the RenderFlex.
Consider applying a flex factor (e.g. using an Expanded widget) to force the children of the
RenderFlex to fit within the available space instead of being sized to their natural size.
This is considered an error condition because it indicates that there is content that cannot be
seen. If the content is legitimately bigger than the available space, consider clipping it with a
ClipRect widget before putting it in the flex, or using a scrollable container rather than a Flex,
like a ListView.
The specific RenderFlex in question is: RenderFlex#a79f0 relayoutBoundary=up16 OVERFLOWING:
  needs compositing
  creator: Column ← Expanded ← Column ← KeyedSubtree-[GlobalKey#2d37c] ← _BodyBuilder ← MediaQuery ←
    LayoutId-[<_ScaffoldSlot.body>] ← CustomMultiChildLayout ← _ActionsScope ← Actions ←
    AnimatedBuilder ← DefaultTextStyle ← ⋯
  parentData: offset=Offset(0.0, 273.0); flex=1; fit=FlexFit.tight (can use size)
  constraints: BoxConstraints(0.0<=w<=360.0, h=121.0)
  size: Size(360.0, 121.0)
  direction: vertical
  mainAxisAlignment: start
  mainAxisSize: max
  crossAxisAlignment: center
  verticalDirection: down
◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤*/